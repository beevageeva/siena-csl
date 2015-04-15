namespace :keywords_index do
	desc 'create keywords index ferret'
	task :create_index => :environment do
			require_relative "../../app/helpers/spelling_corrector.rb"
			#require File.expand_path("app/helpers/spelling_corrector.rb")
			
			FERRET_INDEX_DIR = "#{Rails.root.to_s}/ferret_index/"
			Question.all.each do |question|
				content = question.content
				question.question_responses.each do |qr|
					content += (" " +  qr.response )
				end 
				question.nodes.each do |n|
					content += (" " + n.content  )
				end
		
				SpellingCorrector.searchDBpedia(content , File.join(FERRET_INDEX_DIR, question.id.to_s))
			end
		


	end

end
