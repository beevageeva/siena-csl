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


#START NOT USED

def self.checkWikipedia(pw, locale="es")
	require 'net/http'
	require 'json'	
	pageuri = "http://#{locale}.wikipedia.org/w/api.php?action=opensearch&search=#{pw}"	
	
		ActiveRecord::Base.logger.warn "***#{pageuri}"	

	#page = mechanize.get(pageuri)
	#print("WIKI PAGE IS")
	#print(page)

	result = Net::HTTP.get(URI.parse(pageuri))
	r1 = JSON.parse(result)
	if(r1.kind_of?(Array) && r1.length == 4 )
		if r1[1].kind_of? Array
			if r1[1].length > 0
				return pw
			end
		end
	end
	return nil
end


def self.proposedKeywords2 text, locale="es"

	#session locale is nil
	if locale.nil? || locale == ""
		locale = "es"
	end
	
 
	require 'lingua/stemmer'
	stemmer= Lingua::Stemmer.new(:language => locale)

	result=[]
	text.split(/\W+/).each do |w|
		wroot = stemmer.stem(w)
		(edits1(w, locale) | edits1(wroot, locale)).each do |pw|
			if (r = checkWikipedia(pw, locale)) and result.include?(r)
				result.push(pw)
			end

		end
	end	

end

def self.analyzeTest(test)
	 ActiveRecord::Base.logger.warn("ANALYZETEST Test is #{test.id}")
	answers = test.answers
	puts("answers size = #{answers.size}")
	ChatMessage.joins(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).includes(:grouptest_chatmessages).order("chat_messages.created_at").each do |cm|
		puts("qnumber = #{cm.grouptest_chatmessages[0].qnumber}")
		if(cm.grouptest_chatmessages[0].qnumber<answers.size )
			question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
			messagebody = cm.body.split(":",3)[2]
			puts("Messagebody is #{messagebody}")
			messagebody.scan(/[[:word:]]+/u).each do |word|
				word.downcase! 
				puts("Word is #{word}")
				keywords = SpellingCorrector.proposedKeywords(word)
				#print("keywords is ")
				#puts(keywords)
				if keywords
							fpk = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, keywords )
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
							newfpk.save
						end
				end
			end
		end

	end
end
#END NOT USED


def self.proposedKeywords word, locale="es"

	stopWordsFile="/var/www/siena-csl/stemmer/stop-spanish-snowball-tartarus.txt.utf8-oneline"

	#session locale is nil
	if locale.nil? || locale == ""
		locale = "es"
	end
	
	require 'lingua/stemmer'
	stemmer= Lingua::Stemmer.new(:language => locale)

	result=[]
	wroot = stemmer.stem(word)
	listkeywords = [word, wroot] | edits1(word, locale) | edits1(wroot, locale)
		
	res = false	
	File.foreach(stopWordsFile) do |ww|
		if listkeywords.include?(ww.strip)
			res = true		
			break
		end

	end
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


def self.analyzeTest2(test)
	 ActiveRecord::Base.logger.warn("ANALYZETEST Test is #{test.id}")
	answers = test.answers
	puts("answers size = #{answers.size}")
	ChatMessage.joins(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).includes(:grouptest_chatmessages).order("chat_messages.created_at").each do |cm|
		puts("qnumber = #{cm.grouptest_chatmessages[0].qnumber}")
		if(cm.grouptest_chatmessages[0].qnumber<answers.size )
			question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
			messagebody = cm.body.split(":",3)[2]
			puts("Messagebody is #{messagebody}")
			prevKeywords = []
			messagebody.scan(/[[:word:]]+/u).each do |word|
				word.downcase! 
				puts("Word is #{word}")
				keywords = SpellingCorrector.proposedKeywords(word)
				#print("keywords is ")
				#puts(keywords)
				if keywords
							fpk = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, keywords )
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
							newfpk.save
						end
						#group of keywords
						chmids = ChatMessageKeyword.where("keyword = ?", word).pluck("chat_message_id")
						ChatMessageKeyword.where("keyword  in ? and chat_message_id in ?", prevKeywords, chmids).each do |cmk|
							orderedKG = (cmk.heyword<=>word) < 0 ? "|#{cmk.keyword}|#{word}|" : "|#{word}|#{cmk.keyword}|" 
						end
								
						prevKeywords.push(word) if ! prevKeywords.include?(word)			


				end
			end
		end

	end
end

end
