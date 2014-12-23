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



def self.analyzeTest(test)
	 #ActiveRecord::Base.logger.warn("ANALYZETEST Test is #{test.id}")
	 puts("ANALYZETEST Test is #{test.id}")
	answers = test.answers
	puts("answers size = #{answers.size}")
	ChatMessage.joins(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).includes(:grouptest_chatmessages).order("chat_messages.created_at").select("grouptest_chatmessages.qnumber, chat_messages.from_id , chat_messages.body").distinct().each do |cm|
		puts("qnumber = #{cm.grouptest_chatmessages[0].qnumber}")
		if(cm.grouptest_chatmessages[0].qnumber<answers.size )
			question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
			messagebody = cm.body.split(":",3)[2]
			puts("Messagebody is #{messagebody}")
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
							newfpk.state = ProposedKeyword::NEW_STATE
							newfpk.save
						end
						#group of keywords
						cmk = ChatMessageKeywords.new
						cmk.keyword = word
						cmk.chat_message_id = cm.id
						cmk.save

				end
			end
		end

	end
end

end
