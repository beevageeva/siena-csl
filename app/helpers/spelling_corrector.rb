module SpellingCorrector


def self.words text
  text.downcase.scan(/[a-z]+/)
end


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
		return w if text.include?(w)
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

end
