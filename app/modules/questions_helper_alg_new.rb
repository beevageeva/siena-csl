module QuestionsHelperAlgNew

  ActiveRecord::Base.logger.warn "****************Loading module QuestionsHelperAlgNew"

  def mustStop(test_id)
		ActiveRecord::Base.logger.warn("*** CallQuestionsHelperAlgNew.mustStop *****")

    test = Test.find(test_id)
    minquest = 10
    testquest = 5
    maxquest = 20
    maxpointsvar = 0.01
    delta = 0.06
    return false if test.answers.size  < minquest
    return true if test.answers.size > maxquest
    ActiveRecord::Base.logger.warn "test  points  #{test.points}"
    if test.points >=1.0 - maxpointsvar ||  test.points <= maxpointsvar
      ActiveRecord::Base.logger.info "test points is 1 or 0"
      return true
    end
    for i in 1..testquest
      return false if  (test.points - test.answers[test.answers.size - i].pointsBefore).abs > delta
    end
    return true
  end


  def generate_question_id(test_id)
		ActiveRecord::Base.logger.warn("*** CallQuestionsHelperAlgNew.generate_question_id *****")
    test = Test.find(test_id)
    #TODO sql executed every time test.answers is called?
    w1 = 0.5
		#change by claudia see mail gmail 16.07.2014
    #allQuestions = test.work.node.questions
		condMap = {:node_id => test.work.node_id}
		if(test.answers.size>0)
			difStr = " and " + ( test.answers.last.correctAnswer? ? "questions.difficulty >= :question_difficulty" : "questions.difficulty <= :question_difficulty"  )
    	lastQuestDiff = test.answers.last.question.difficulty
			condMap[:question_difficulty] = lastQuestDiff
		else
			difStr = ""
		end
		allQuestions = Question.includes(:nodes).where("nodes.id = :node_id and questions.difficulty > questions.luck" + difStr ,condMap )		
    testQuestions = test.answers.map{|a| a.question}
    availQuestions = allQuestions - testQuestions
    if(availQuestions.size >0)
      toChooseQuestions = []
      resQuestion = nil
      if(testQuestions.size > 0)
        pointsarray = test.answers.map{|p| p.pointsBefore}
        lastP = pointsarray.last
        modif = test.answers.last.correctAnswer?  ? 1 : -1
        maxFunc = 0
        availQuestions.each do |cQuestion|
          diffRes = (modif * (cQuestion.difficulty - lastQuestDiff) * lastP) / (cQuestion.difficulty * lastP + (1 - lastP) * cQuestion.luck)
          modif2 = diffRes < 0.001 ? diffRes : 1- diffRes
          dep = NodeQuestionRelation.find_by_node_id_and_question_id(test.work.node_id, cQuestion.id).dep
          cFunc = (1 - w1) * dep +  w1 * modif2
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
    ActiveRecord::Base.logger.warn "**** Call QuestionsHelperAlgNew.getNewPoints question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP}, correctAnswer=#{correctAnswer}"
    if correctAnswer
      first = (1.0-lastQDif) * lastP
      second = first + (1.0 - lastP) *  lastQLuck
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
      first = lastQDif * lastP
      second = first + (1 - lastP) *  (1.0-lastQLuck)
      newLastP = second == 0 ? 1 : (first / second)
      if newLastP > lastP
        ActiveRecord::Base.logger.info "question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP} , fisrt = #{first}, second = #{second}, newLastP = #{newLastP}, correctAnswer=#{correctAnswer}"
        return lastP
      end
    end
    return newLastP
  end




end
