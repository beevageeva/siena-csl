namespace :search_keywords do
	desc 'search keyowrds from messages in index'

	#NKEYW = 3
	NKEYW = 2

	task :search => :environment do
			require_relative "../../app/helpers/spelling_corrector.rb"
			#require File.expand_path("app/helpers/spelling_corrector.rb")
		
		if NKEYW==3		
		query = "select distinct cm1.previous  as c1, cm1.keyword as c2, cm2.keyword as c3 from chat_message_keywords cm1 INNER JOIN chat_message_keywords cm2 ON cm1.keyword = cm2.previous WHERE cm1.chat_message_id = cm2.chat_message_id AND (cm2.keyword = :keyword OR cm2.previous = :keyword OR cm1.previous = :keyword ) and cm1.question_id = :question_id and cm1.previous is not null"
		elsif NKEYW == 2
		query = "select distinct cm.previous  as c1, cm.keyword as c2  from chat_message_keywords cm WHERE (cm.keyword = :keyword OR cm.previous = :keyword ) and cm.question_id = :question_id and cm.previous is not null"
		end
			FERRET_INDEX_DIR = "#{Rails.root.to_s}/ferret_index/"
			Question.all.each do |question|
				resKeywords  = ProposedKeywords.where("question_id = ?", question.id).order("state asc, count desc")
				indexFile = File.join(FERRET_INDEX_DIR, question.id.to_s)
				resKeywords.each do |kw|	
					keyword = kw.keyword
					chat_messages = ChatMessageKeywords.find_by_sql([query, {:question_id => question.id, :keyword => keyword }])
					chat_messages.each do |cm|
						if  NKEYW==3
							toSearchArray = [cm.c1,cm.c2,cm.c3]
						elsif NKEYW==2
							toSearchArray = [cm.c1,cm.c2]
						end
						highlights = SpellingCorrector.searchIndex(toSearchArray, indexFile)
						if highlights.size > 0
							print("HIGHLIGHTS found")
							print(highlights)
	
						end
					end

				end
			end
		


	end

end
