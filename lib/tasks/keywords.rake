namespace :keywords do
	desc 'create keywords'
	task :create => :environment do
			require_relative "../../app/helpers/spelling_corrector.rb"
			#require File.expand_path("app/helpers/spelling_corrector.rb")
			
			Test.all.each do |test|
				SpellingCorrector.analyzeTest(test)		
			end
		


	end

end
