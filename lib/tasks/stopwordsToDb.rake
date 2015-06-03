namespace :stopwordsToDb do
	desc 'insert stopwords from file to db'


	task :insert => :environment do
		stopWordsFile="/var/www/siena-csl/stemmer/stop-spanish-snowball-tartarus.txt.utf8-oneline"
		File.foreach(stopWordsFile) do |ww|
			s = Stopword.create(word: ww.strip)
			print("inserted stopword #{s}")
	
		end
	end

end
