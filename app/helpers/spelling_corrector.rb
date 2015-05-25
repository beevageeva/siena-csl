module SpellingCorrector




LETTERS = ("a".."z").to_a.join

def self.edits1 word, locale
  n = word.length
  deletion = (0...n).collect {|i| word[0...i]+word[i+1..-1] }
  transposition = (0...n-1).collect {|i| word[0...i]+word[i+1,1]+word[i,1]+word[i+2..-1] }
  alteration = []
  n.times {|i| LETTERS.each_byte {|l| alteration << word[0...i]+l.chr+word[i+1..-1] } }
  insertion = []
  (n+1).times {|i| LETTERS.each_byte {|l| insertion << word[0...i]+l.chr+word[i..-1] } }
  result = deletion + transposition + alteration + insertion
	#TODO try to put word derivations depending on each locale: the word may be a phrase part
	#if(locale == "es")
	#	result <<  word + "es" 	if !word.ends_with?("s") #plural
	#end	
  return result
	
end


def self.iscorrect text, keyword, locale
	if text.include?(keyword)
		return keyword 		
	end
	edits1(keyword, locale).each do |w|
		#If want to keep the mispelled word
		#return w if text.include?(w)
		return keyword if text.include?(w)
	end
	return nil
end



def self.keywords text, listwordstr, locale
	res = []
	if(!listwordstr.nil?)
		listwords = listwordstr.split(Question::KEYWORDS_SEP)
		listwords.each do |keyword|
			keyword.strip!
			found = iscorrect text, keyword, locale
			if found	
				res.append(found) 		
			end
		end
	end
	return res
end

def self.listWithRootAndMispelled(word, locale="es")
	require 'lingua/stemmer'
	stemmer= Lingua::Stemmer.new(:language => locale)

	wroot = stemmer.stem(word)
	return [word, wroot] | edits1(word, locale) | edits1(wroot, locale)
	
end

def self.isStopWord(listkeywords)
	stopWordsFile="/var/www/siena-csl/stemmer/stop-spanish-snowball-tartarus.txt.utf8-oneline"
	File.foreach(stopWordsFile) do |ww|
		if listkeywords.include?(ww.strip)
			return true		
		end

	end
	return false
end

def self.proposedKeywords word, locale="es"


	#session locale is nil
	if locale.nil? || locale == ""
		locale = "es"
	end
	
	listkeywords = listWithRootAndMispelled(word)
	res = isStopWord(listkeywords)	
	#res = open(stopWordsFile){|f| f.grep(/#{listkeywords.join("|")}/)}
	puts("Result grep is #{res}")	
	if res	
		return nil
	else
		return listkeywords
	end
end


def self.stemmedWord(word, locale="es")
	require 'lingua/stemmer'
	return Lingua::Stemmer.new(:language => locale).stem(word)
end



def self.analyzeTest(test)
	 #ActiveRecord::Base.logger.warn("ANALYZETEST Test is #{test.id}")
	 puts("ANALYZETEST Test is #{test.id}")
	answers = test.answers
	puts("answers size = #{answers.size}")
	#TODO DEPRECATION WARNING: uniq_by is deprecated. Use Array#uniq instead. (called from irb_binding at (irb):56)
	#BUT UNIQ is not WORKING!!!!!!
	ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).order("chat_messages.created_at").uniq_by {|c| [c.body, c.from_id, c.grouptest_chatmessages[0].qnumber]}.each do |cm|

		puts("qnumber = #{cm.grouptest_chatmessages[0].qnumber}")
		if(cm.grouptest_chatmessages[0].qnumber<answers.size )
			question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
			messagebody = cm.body.split(":",3)[2]
			puts("Messagebody is #{messagebody}")
			previous = nil
			messagebody.scan(/[[:word:]]+/u).each do |word|
				word.downcase! 
				puts("Word is #{word}")
				pkeywords = SpellingCorrector.proposedKeywords(word)
				#print("keywords is ")
				#puts(keywords)
				if pkeywords
							fpk = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, pkeywords )
						 if fpk && fpk.size > 0
							puts("Keyword #{word} found size = #{fpk.size}")
							fpk[0].count +=1
							fpk[0].save
							
						else
							puts("Keyword #{word} adding")
							newfpk = ProposedKeywords.new
							newfpk.count = 1
							newfpk.question_id = question_id
							#newfpk.keyword = SpellingCorrector.stemmedWord(word)
							newfpk.keyword = word
							newfpk.state = ProposedKeywords::NEW_STATE
							newfpk.save
						end
						#group of keywords
						cmk = ChatMessageKeywords.new
						cmk.keyword = word
						cmk.previous = previous
						cmk.question_id = question_id
						previous = word
						cmk.chat_message_id = cm.id
						cmk.save

				end
			end
		end

	end
end

def self.searchDBpedia(content, indexFile)

	ActiveRecord::Base.logger.warn "**************CONTENT= #{content}"	
	require 'sparql/client'


	words = content.split(/\W+/u)

	#TODO do I need to include stemmed?
	#I already know that these are not MISPELLED

	queryTemp = "
	select * where { 
  	?s dbpedia-owl:abstract ?abstract .
  	?abstract bif:contains \"SEARCHTERM\" .
  	filter langMatches(lang(?abstract),\"es\")
	}
	limit 10
	"

	require 'ferret'  
	include Ferret  
  
	# get or create an index on the filesystem  
	index = Index::Index.new(:path => indexFile)  

	client = SPARQL::Client.new("http://dbpedia.org/sparql")

	#TODO do I really need to define these here?
	uri = ""
	abstract = ""

	words.each do |word|
		next if word.strip == "" or word.length<3
		#for group of words I must enclose them in '' for example :  'word1 word2'
		query = queryTemp.gsub("SEARCHTERM", word)	
		ActiveRecord::Base.logger.warn "search #{word} , query = #{query}"	
		result = client.query(query)
		result.each_solution do |solution|
  		solution.each_binding  do |name, value| 
				if(name == :s)
					uri = value
				elsif(name==:abstract)
					abstract = value
				end
			end
			
			foundUri = (index.search("uri: \"#{uri}\"").hits.size > 0) 
			ActiveRecord::Base.logger.warn "DB pedia URI #{uri} , found = #{foundUri.to_s}"	
			if(!foundUri)
				index << {  
  				:uri => uri,  
  				:abstract => abstract  
				}
			end  
		end  #each_solution
	#TODO !!!!! search by number of cvommon occurences!
	#question.flatten.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)	
	end #each word

end
def self.searchDBpediaOld(content, indexFile)

	ActiveRecord::Base.logger.warn "**************CONTENT= #{content}"	
	require 'sparql/client'


	words = content.split(/\W+/u)

	#TODO do I need to include stemmed?
	#I already know that these are not MISPELLED

	queryTemp = "
	select * where { 
  	?s dbpedia-owl:abstract ?abstract .
  	?abstract bif:contains \"SEARCHTERM\" .
  	filter langMatches(lang(?abstract),\"es\")
	}
	limit 10
	"

	require 'ferret'  
	include Ferret  
  
	# get or create an index on the filesystem  
	index = Index::Index.new(:path => indexFile)  

	client = SPARQL::Client.new("http://dbpedia.org/sparql")

	#TODO do I really need to define these here?
	uri = ""
	abstract = ""

	words.each do |word|
		next if word.strip == "" or word.length<3
		#for group of words I must enclose them in '' for example :  'word1 word2'
		query = queryTemp.gsub("SEARCHTERM", word)	
		ActiveRecord::Base.logger.warn "search #{word} , query = #{query}"	
		result = client.query(query)
		result.each_solution do |solution|
  		solution.each_binding  do |name, value| 
				if(name == :s)
					uri = value
				elsif(name==:abstract)
					abstract = value
				end
			end
			
			foundUri = (index.search("uri: \"#{uri}\"").hits.size > 0) 
			ActiveRecord::Base.logger.warn "DB pedia URI #{uri} , found = #{foundUri.to_s}"	
			if(!foundUri)
				index << {  
  				:uri => uri,  
  				:abstract => abstract  
				}
			end  
		end  #each_solution
	#TODO !!!!! search by number of cvommon occurences!
	#question.flatten.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)	
	end #each word

end

def self.getQueryFor(keyword)
		query=""
		listkeywords = listWithRootAndMispelled(keyword)
		for index in 0..listkeywords.size - 1
			query+=listkeywords[index] + "|"
		end
		query+=listkeywords[listkeywords.size - 1]
		return query 
end


def self.searchIndex(keyword, indexFile)
		require 'ferret'  
		#ActiveRecord::Base.logger.warn("**********************KEYWORD #{keyword}")	
		query = "abstract:(\""

		if keyword.is_a? String
			query+=self.getQueryFor(keyword)
		elsif keyword.is_a? Array
			for i in 0..keyword.size - 1
				kwterm = keyword[i]
				query+=self.getQueryFor(kwterm)+ " "	

			end
			query+=self.getQueryFor(keyword[keyword.size - 1])
			
		end

		query+="\")"	


		index = Ferret::Index::Index.new(:path => indexFile)  
		highlights = []	
		#ActiveRecord::Base.logger.warn "-------------------SEARCH INDEX query: #{query} "
		index.search_each(query) do |id, score|
    	highlight = index.highlight(query, id,
                                 :field => :abstract,
                                 :pre_tag => "<b>",
                                 :post_tag => "</b>")
			#ActiveRecord::Base.logger.warn "FOUND HIGHLIGHT #{highlight}"
			highlights.push({:score=>score , :uri=>index[id][:uri], :highlight=>highlight})
  	end
		return highlights
end

end
