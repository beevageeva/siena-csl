module QuestionsHelperAlgOld


	ActiveRecord::Base.logger.warn("****Loading module QuestionsHelperAlgOld *****")


	def mustStop(test_id)
					ActiveRecord::Base.logger.warn("*** CallQuestionsHelperAlgOld.mustStop *****")
					test = Test.find(test_id)
					minquest = 5
					maxpointsvar = 0.01
					return false if test.answers.size			 < minquest 
#there must have at least 1 question in the last %minquest%		 points - points.before > 0.1
#							 a = test.points
#							 (1..minquest).each do |i|
#											 if a - test.answers[test.answers.size - i].pointsBefore).abs		>= maxpointsvar
#															 ActiveRecord::Base.logger.warn "TESTPOINTS:"+a.to_s
#															 ActiveRecord::Base.logger.warn "TESTPOINTSBEFORE:"+test.answers[test.answers.size - i].pointsBefore.to_s
#															 ActiveRecord::Base.logger.warn "abs:"+(a - test.answers[test.answers.size - i].pointsBefore).abs.to_s
#															 return false
#											 end
#											 a = test.answers[test.answers.size - i].pointsBefore
#							 end
#							 return true

#last question points - points before question minquest before > 0.1 , this allow incremental improvement in the last minquest questions
					#now points change when answer is incorrect						 
					return	(test.points - test.answers[test.answers.size - minquest].pointsBefore).abs < maxpointsvar

	end

	def generate_question_id(test_id)
					ActiveRecord::Base.logger.warn("*** CallQuestionsHelperAlgOld.generate_next_question_id *****")
					test = Test.find(test_id)
					#TODO sql
					w1 = 0.5
					allQuestions = test.work.node.questions
					testQuestions = test.answers.map{|a| a.question}
					availQuestions = allQuestions - testQuestions
					if(availQuestions.size >0)
									toChooseQuestions = []
									resQuestion = nil
									if(testQuestions.size > 0)
													pointsarray = test.answers.map{|p| p.pointsBefore}
													lastP = pointsarray.last
													modif = test.answers.last.correctAnswer?				? 1 : -1
													lastQuestDiff = test.answers.last.question.difficulty
													maxFunc = 0
													availQuestions.each do |cQuestion|
																	diffRes = (modif * (cQuestion.difficulty - lastQuestDiff) * lastP) / (cQuestion.difficulty * lastP + (1 - lastP) * cQuestion.luck)
																	modif2 = diffRes < 0.001 ? diffRes : 1- diffRes
																	dep = NodeQuestionRelation.find_by_node_id_and_question_id(test.work.node_id, cQuestion.id).dep
																	cFunc = (1 - w1) * dep +				w1 * modif2
																	if (cFunc > maxFunc)
																					maxFunc = cFunc
																					toChooseQuestions = [cQuestion]
																	elsif cFunc == maxFunc
																					toChooseQuestions.push(cQuestion)
																	end
																	resQuestion = toChooseQuestions[rand(toChooseQuestions.size)] if toChooseQuestions.size>0
													end
									end
									resQuestion = availQuestions[rand(availQuestions.size)] if ! resQuestion
									ActiveRecord::Base.logger.warn("****next question id *****" + resQuestion.id.to_s)
									return resQuestion.id
					end
					return false
	end

		def getNewPoints(lastP, lastQDif, lastQLuck, correctAnswer)
					ActiveRecord::Base.logger.warn "**** Call QuestionsHelperAlgOld.newPoints question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP}, correctAnswer=#{correctAnswer}"
					if correctAnswer
									first = (1.0-lastQDif) * lastP
									second = first + (1.0 - lastP) *				lastQLuck
									newLastP = second == 0 ? 1 : (first / second)
									if newLastP >=1
													ActiveRecord::Base.logger.info "newLastP >=1 "
													return 1
									end
									#if dif < luck -- points will go down
									if newLastP < lastP
													ActiveRecord::Base.logger.info "question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP} , fisrt = #{first}, second = #{second}, newLastP = #{newLastP}, correctAnswer=#{correctAnswer}"
													return lastP
									end
					else
									newLastP = lastP
					end
					return newLastP
	end






end

