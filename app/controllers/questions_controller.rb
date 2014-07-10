require 'works_helper'

class QuestionsController < ApplicationController
 

before_filter(:only => [:destroy ,:edit, :update ] ) { |c| c.auth  [ {:types =>  [User::PROF] , :condition => lambda{|params,session| Question.find(params[:id]).teacher_id == session[:useraccount_id]} } , {:types => [User::ADMIN]} ]  }
before_filter(:only => [:new, :create , :listByCourse, :show, :deleteImgFile] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } ]  }
 before_filter(:only => [:index] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }
 before_filter(:only => [:test,:answer, :regenerate_student_id] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanTestWork(Test.find(params[:test_id]).work_id,session[:useraccount_id])   }  }]  }
 before_filter(:only => [:starttest] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanTestWork(params[:work_id],session[:useraccount_id])   }  }]  }

include WorksHelper
include QuestionsHelper

# after_filter :set_content_type , :only => [:show]  
	

	layout :green_web



	# GET /questions
	# GET /questions.xml
	def index
		@questions = initialize_grid(Question , {:include => ["course"]})

	  respond_to do |format|
	    format.html # index.html.erb
	    format.xml  { render :xml => @questions }
	  end
	end

	def listByCourse
		@questions = initialize_grid(Question , {:conditions => ["course_id = #{params[:course_id]}"]})
	end

	# GET /questions/1
	# GET /questions/1.xml
	def show
	  @question = Question.find(params[:id])
		@nodes = initialize_grid(Node, {:conditions => ['node_question_relations.question_id = ?', @question], :include => [:node_question_relations]})

	  respond_to do |format|
	    format.html # show.html.erb
	    format.xml  { render :xml => @question }
	  end
	end

	
	def test
		test_id = params[:test_id]
		test = Test.find(test_id)
		#TODO now we create the answers before , so continuiing old tests which do not have any answers  will not work 
		if test.answers.size ==0
			test.finished = true
			test.save
		end
		if test.finished
			flash[:notice] = "Test finished"
			redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => test.work.node.course_id , :assignedto_id => test.work.assignedto_id, :assignedto_type => test.work.assignedto_type
		else
			@answer = test.answers.last
			qnumber = test.answers.size - 1
			@question = @answer.question
			# viewed_test_questions
			vtq = ViewedTestQuestion.find_by_student_id_and_test_id_and_qnumber(session[:useraccount_id], test_id, qnumber )
			if !vtq
				vtq = ViewedTestQuestion.new
				vtq.student_id = session[:useraccount_id]
				vtq.test_id = test.id
				vtq.qnumber = qnumber
				vtq.ntimes = 1
			else
				vtq.ntimes += 1
			end
			vtq.save
			#ActiveRecord::Base.logger.warn("****************************" + session[:useraccount_id].to_s)
			if test.work.assignedto_type == Work::ASSIGNEDTOALUGROUP &&   @answer.student_id != session[:useraccount_id]
				render :action => "showTestAluGroup"	
			else
				render :action => "answerForm"	
			end
		end	

	end

	# GET /tests/new
	# GET /tests/new.xml
	def starttest
	work = Work.find(params[:work_id])
		#AUTH
	if !(canTest(Work.find(params[:work_id]).node, work.assignedto_id, work.assignedto_type))
	    		flash[:notice] = "You must login"
	    		redirect_to(login_url)
		
	  	else
	  		test = Test.new
		test.work_id = params[:work_id]

#media de los tests
#		if(work.tests && work.tests.size > 0)
#			@test.points = 0
#			n = 0
#			work.tests.each do |t|
#				@test.points += t.points
#				n+=1
#			end
#			@test.points/=n
#		else
			#initialpoints null	
			if work.initialpoints.nil?
				test.points = Work::DEFAULT_INIT_POINTS
			else 
				test.points = work.initialpoints
			end
#		end

		test.finished = false
		if test.save
			student_id = session[:useraccount_id]
			if work.assignedto_type == Work::ASSIGNEDTOALUGROUP
				GrouptestStudent.create({:test_id => test.id , :student_id => student_id})
			end
			if check_finish_test_and_create_answer(test.id)
				if work.assignedto_type == Work::ASSIGNEDTOALUGROUP
					work.assignedto.onlinestudents.each do |s|
					if s.id != student_id
						ChatMessage.create(:from_id => student_id, :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_STARTTEST, :body => test.id )
					end
						
					end
					
				end
				redirect_to :controller => "questions" , :action => "test" , :test_id => test.id	
				return
			end
		end	
	  	end
	flash[:notice] = "Error empezando el test"
	redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => work.node.course_id , :assignedto_id => work.assignedto_id, :assignedto_type => work.assignedto_type
	end





	def answer
		test = Test.find(params[:test_id])
		return if test.finished	
		@answer = test.answers.last
		if @answer.student_id != session[:useraccount_id]
			flash[:notice] = "Answer user changed, you are not allowed to answer"
			redirect_to :action => "test" , :test_id => params[:test_id]
			return
		end
		@answer.pointsBefore = test.points
		@answer.responsetime = Time.new
		@answer.number = params[:selectedAnswer].to_i
		@answer.timeleft = params[:timeleft].to_i
		if @answer.save
			flash[:notice] = "Answer saved"
			adjustPoints(@answer.test)
			if @answer.test.work.assignedto_type == Work::ASSIGNEDTOALUGROUP
				#insert messages
				student_id = session[:useraccount_id]
				test.work.assignedto.online_testing_students(params[:test_id]).each do |s|	
					if s.id != student_id
						ChatMessage.create(:from_id => student_id, :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_ANSWER, :body => params[:test_id] )
					end
				end	
			end
			if check_finish_test_and_create_answer(params[:test_id])
				redirect_to :action => "test" , :test_id => params[:test_id]
				return
			end
		end	
		work = @answer.test.work
		redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => work.node.course_id , :assignedto_id => work.assignedto_id, :assignedto_type => work.assignedto_type
	end



	# GET /questions/new
	# GET /questions/new.xml
	def new
	  @question = Question.new
		@question.course_id = params[:course_id]

	  respond_to do |format|
	    format.html # new.html.erb
	    format.xml  { render :xml => @question }
	  end
	end

	# GET /questions/1/edit
	def edit
	  @question = Question.find(params[:id])
		@nodes = initialize_grid(Node, {:conditions => ['node_question_relations.question_id = ?', @question], :include => [:node_question_relations]})
	end

	# POST /questions
	# POST /questions.xml
	def create
	  @question = Question.new(question_params)
	if User.find(session[:userid]).useraccount_type == User::PROF
		@question.teacher_id = session[:useraccount_id]
	else
		@question.teacher_id = Teacher.limit(1).pluck("id").first

	end

	    if @question.save
	      flash[:notice] = 'Pregunta creada.'
				redirect_to  :action => "edit" , :id => @question.id
	    else
	      render :action => "new" 
	    end
	end


	def deleteImgFile
	  question = Question.find(params[:question_id])
	  question.deleteImgFile
	  redirect_to :action => 'edit' , :id => question.id
	end




	# PUT /questions/1
	# PUT /questions/1.xml
	def update
	  @question = Question.find(params[:id])
	  if @question.update(question_params)
	    flash[:notice] = t('question_updated_success')
	    redirect_to(@question) 
	  else
			@nodes = initialize_grid(Node, {:conditions => ['node_question_relations.question_id = ?', @question], :include => [:node_question_relations]})
	    render :action => "edit" 
	  end
	end

	# DELETE /questions/1
	# DELETE /questions/1.xml
	def destroy
	  @question = Question.find(params[:id])
	  @question.deleteImgFile
	  @question.destroy
	  redirect_to :action => "listByCourse" , :course_id => @question.course_id
	end


	def regenerate_student_id
		test = Test.find(params[:test_id])
		return if test.finished
		new_student_id = generate_student_id(params[:test_id])
		if new_student_id
			answer = test.answers.last
			answer.student_id = new_student_id
			answer.save
			test.work.assignedto.online_testing_students(params[:test_id]).each do |s|	
				if s.id != session[:useraccount_id]
					ChatMessage.create(:from_id => session[:useraccount_id], :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_REASSIGNUSER, :body => params[:test_id] )
				end
			end	
			flash[:notice] = "reassigned user"
		else
			flash[:notice] = "cannot reassign user"
		end
		redirect_to :action => "test", :test_id => params[:test_id]
		
	end


private


	def check_finish_test_and_create_answer(test_id)
		finishtest = false
		#TODO ruby 1.9 fixes this : why declare nqid here??
		nqid = nil
		test = Test.find(test_id)
		ActiveRecord::Base.logger.warn "Finish test and create answer"	
		if mustStop(test_id)
			flash[:notice] = "Test must stop"
			finishtest = true
		else
			nqid = generate_question_id(test_id)
			if ! nqid
				flash[:notice] = "No more questions"
				finishtest = true
			end
			if test.work.assignedto_type == Work::ASSIGNEDTOSTUDENT
				student_id =  session[:useraccount_id]
			else
				student_id = generate_student_id(test_id)	
			end
			if ! student_id 
				flash[:notice] = "No more online"
				finishtest = true
			end	
		end
		if finishtest
			test.finished = true
			test.save
			if test.work.assignedto_type == Work::ASSIGNEDTOALUGROUP
				GrouptestStudent.delete_all(:test_id => test.id) if test.work.assignedto_type = Work::ASSIGNEDTOALUGROUP
			end	
			return false			
		else
			answer = Answer.new
			answer.student_id = student_id
			answer.question_id = generate_question_id(test_id)
			answer.test_id = test_id
			#TODO pointsbefore set here, there is no need  for checking it !=nil in tests.show view
			answer.pointsBefore = test.points
			answer.save
			return true
		end

	end





	#This is not needed (new firefox version??)
	#def set_content_type
	#   headers['Content-Type'] = 'application/xhtml+xml; charset=utf-8'
	#end

	def adjustPoints(test) 
	  lastP = test.points
		lastQuestion = test.answers.last.question
		test.points = getNewPoints(lastP, lastQuestion.difficulty, lastQuestion.luck, test.answers.last.correctAnswer?)
		test.save
	end



	def mustStop(test_id)
		test = Test.find(test_id)
		minquest = 5
		maxpointsvar = 0.01
		delta = 0.05
		return false if test.answers.size  < minquest
#there must have at least 1 question in the last %minquest%  points - points.before > 0.1
#		a = test.points
#		(1..minquest).each do |i|
#			if a - test.answers[test.answers.size - i].pointsBefore).abs  >= maxpointsvar
#				ActiveRecord::Base.logger.warn "TESTPOINTS:"+a.to_s
#				ActiveRecord::Base.logger.warn "TESTPOINTSBEFORE:"+test.answers[test.answers.size - i].pointsBefore.to_s
#				ActiveRecord::Base.logger.warn "abs:"+(a - test.answers[test.answers.size - i].pointsBefore).abs.to_s
#				return false
#			end
#			a = test.answers[test.answers.size - i].pointsBefore
#		end
#		return true

#last question points - points before question minquest before > 0.1 , this allow incremental improvement in the last minquest questions
		#now points change when answer is incorrect		
		#return 	(test.points - test.answers[test.answers.size - minquest].pointsBefore).abs < maxpointsvar

		ActiveRecord::Base.logger.warn "test  points  #{test.points}"	
		if test.points >=1.0 - maxpointsvar ||  test.points <= maxpointsvar
			ActiveRecord::Base.logger.info "test points is 1 or 0"
			return true
		end
		for i in 1..minquest
   		return true if  (test.points - test.answers[test.answers.size - i].pointsBefore).abs > delta
		end	
		return false
	end

	def generate_question_id(test_id)
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
				modif = test.answers.last.correctAnswer?  ? 1 : -1
	      lastQuestDiff = test.answers.last.question.difficulty
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

def generate_student_id(test_id)
	test = Test.find(test_id)
	alu_group=test.work.assignedto
	already_answered_student_ids = test.answers.pluck(:student_id)
	online_testing_students_ids = alu_group.online_testing_students(test_id).pluck(:id)
	#ActiveRecord::Base.logger.warn("ALREADY")
	#ActiveRecord::Base.logger.warn(already_answered_student_ids)
	#ActiveRecord::Base.logger.warn("ONLINE")
	#ActiveRecord::Base.logger.warn(online_testing_students_ids)
	
	return online_testing_students_ids.min{|s1id,s2id| already_answered_student_ids.find_all{|id| id == s1id}.length - already_answered_student_ids.find_all{|id| id == s2id}.length  }

end


	private

	def question_params
			params.require(:question).permit(:content, :answerTime, :correctAnswer, :difficulty, :luck, :imgFile, :course_id,  :keywords, :img
)
	end






end
