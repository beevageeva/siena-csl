namespace :update do
	desc 'update points'
	#TODO execute in the db: why this happens when dependent => destroy in model work????
	#delete from tests t where not exists (select *  from works w where w.id = t.work_id); 
	task :test_points => :environment do
		require_relative "../../app/modules/questions_helper_alg_new.rb"
		include QuestionsHelperAlgNew
		 Test.all.each do |t|
	    points = Work::DEFAULT_INIT_POINTS
	    if !t.work.initialpoints.nil?
	      points = t.work.initialpoints
	    end
			puts("POINTS >#{points}<")
			t.answers.each do |a|
				a.pointsBefore = points		
				a.save
				q = a.question
				if(!q.nil?)
					points = getNewPoints(points, q.difficulty, q.luck, a.correctAnswer?)
				end
				puts("--------------POINTS >#{points}<")
			end	
			t.points = points
			t.save
		end	
	end

	task :default do
		puts "Hello World!"
	end

end
