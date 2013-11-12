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
	#try to put word derivations depending on ecah locale
	if(locale == "es")
		result <<  word + "es" 	if !word.ends_with?("s") #plural
	end	

  result.empty? ? nil : result
	
end


def self.iscorrect word, listwords, locale
	if listwords.include?(word)
		return true 		
	end
	edits1(word, locale).each do |w|
		return true if listwords.include?(w)
	end
	return false
end



def self.keywords text, listwordstr, locale
	res = []
	if(!listwordstr.nil?)
		listwords = words(listwordstr)
		ActiveRecord::Base.logger.warn("keywords array " + listwords.to_s)	
		words(text).each do |w|
			ActiveRecord::Base.logger.warn("message word " + w)	
			if iscorrect w, listwords,locale
				res.append(w) 		
			end
		end
	end
	return res
end

end
