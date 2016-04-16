class QuestionsController < ApplicationController
 

before_filter(:only => [:destroy ,:edit, :update ] ) { |c| c.auth  [ {:types =>  [User::PROF] , :condition => lambda{|params,session| Question.find(params[:id]).teacher_id == session[:useraccount_id]} } , {:types => [User::ADMIN]} ]  }
before_filter(:only => [:new, :create , :listByCourse, :show, :deleteImgFile] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } ]  }
 before_filter(:only => [:index] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }
 before_filter(:only => [:test,:answer, :regenerate_student_id] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanTestWork(Test.find(params[:test_id]).work_id,session[:useraccount_id])   }  }]  }
 before_filter(:only => [:starttest] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanTestWork(params[:work_id],session[:useraccount_id])   }  }]  }
before_filter(:only => [:showAlu] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } , {:types =>  [User::ALU] , :condition =>  lambda{|params,session| authShowQuestionAlu(params, session)} } ]  }
before_filter(:only => [:createIndexDbPedia, :deleteIndexDbPedia] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } ]  }
include WorksHelper

require_relative "../modules/questions_helper_alg.rb"
require File.expand_path("app/modules/questions_helper_alg.rb")
include QuestionsHelperAlg

FERRET_INDEX_DIR = "#{Rails.root.to_s}/ferret_index/"


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
		@questions = initialize_grid(Question , {:conditions => ["course_id = #{params[:course_id]}"], :include => [:teacher => :user]  })
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

	def showAlu
	  @question = Question.find(params[:question_id])
		render :action => 'showAlu' , layout: false 

	end

	def createIndexDbPedia
	  question = Question.find(params[:question_id])
		content = question.content
		question.question_responses.each do |qr|
			content +=  qr.response 
		end 
		question.nodes.each do |n|
			content += n.content 
		end

		SpellingCorrector.searchDBpedia(content , File.join(FERRET_INDEX_DIR, params[:question_id]))
		redirect_to  :action => "edit" , :id =>  params[:question_id]

	end

	def deleteIndexDbPedia
		 #File.delete(File.join(FERRET_INDEX_DIR, params[:question_id]))
		 system("rm -rf %s"  % (File.join(FERRET_INDEX_DIR, params[:question_id])))
		redirect_to  :action => "edit" , :id =>  params[:question_id]
	end
	
	def test
		test_id = params[:test_id]
		test = Test.find(test_id)
		#TODO now we create the answers before , so continuiing old tests which do not have any answers  will not work 
		if test.answers.size ==0
			test.finished = true
			if(test.save)
				 ActiveRecord::Base.logger.warn "in function test TEst saved"
			else
				 ActiveRecord::Base.logger.warn "!!!!!!!!!!in function test TEst NOT saved"
			end	
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
			cont, an = check_finish_test_and_create_answer(test.id)

			if cont				
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
		else
			 ActiveRecord::Base.logger.warn "!!!! test not saved in startttest"
		end
	 end
	flash[:notice] = "Error empezando el test"
	redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => work.node.course_id , :assignedto_id => work.assignedto_id, :assignedto_type => work.assignedto_type
	end





	def answer
		test = Test.find(params[:test_id])
		if test.finished
			ActiveRecord::Base.logger.warn("answer called but test finished")
			work = test.work
			redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => work.node.course_id , :assignedto_id => work.assignedto_id, :assignedto_type => work.assignedto_type
			return
		end	
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
			#calculate points of test after the answer
			lastQuestion = @answer.question
			test.points = getNewPoints(test.points, lastQuestion.difficulty, lastQuestion.luck, @answer.correctAnswer?)
			
			test.save
			an = false
			ActiveRecord::Base.logger.warn("questions_controller.answer testId=#{params[:test_id]} ,  test points before = #{ @answer.pointsBefore }, points after getNewPoints #{test.points}")

			if @answer.test.work.assignedto_type == Work::ASSIGNEDTOALUGROUP
				#insert messages
				student_id = session[:useraccount_id]
				test.work.assignedto.online_testing_students(params[:test_id]).each do |s|	
					if s.id != student_id
						ChatMessage.create(:from_id => student_id, :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_ANSWER, :body => params[:test_id] )
					end
				end	
			end
			cont, an = check_finish_test_and_create_answer(params[:test_id])
			if cont
				redirect_to :action => "test" , :test_id => params[:test_id]
				return
			end
		end	
		work = @answer.test.work
		redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => work.node.course_id , :assignedto_id => work.assignedto_id, :assignedto_type => work.assignedto_type
		#this is done after response is rendered when the test is finished
		if an
				SpellingCorrector.analyzeTest(test)
		end 
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
			ActiveRecord::Base.logger.warn "check_finish_test.. mustStop = true testid =  #{test_id}"
			finishtest = true
		else
			nqid = generate_question_id(test_id)
			if ! nqid
				flash[:notice] = "No more questions"
				ActiveRecord::Base.logger.warn "check_finish_test.. no more questions = true testid =  #{test_id}"
				finishtest = true
			end
			if test.work.assignedto_type == Work::ASSIGNEDTOSTUDENT
				student_id =  session[:useraccount_id]
			else
				student_id = generate_student_id(test_id)	
			end
			if ! student_id 
				ActiveRecord::Base.logger.warn "check_finish_test WILL RETURN false but test.finished = False.. no more online = true testid =  #{test_id}"
				flash[:notice] = "No more online"
				#finishtest = true
				#I don't want to mark the test as finished
				return false,false
			end	
		end
		ActiveRecord::Base.logger.warn "check_finish_test_and_create_answer finishtest = #{finishtest}"
		if finishtest
			test.finished = true
			#putting following makes it not find app/modules/alg.... see require_relative above
			#require 'spelling_corrector'
			test.save
			if test.work.assignedto_type = Work::ASSIGNEDTOALUGROUP
				GrouptestStudent.delete_all(:test_id => test.id) 
			end
			return false,true			
		else
			answer = Answer.new
			answer.student_id = student_id
			answer.question_id = nqid
			answer.test_id = test_id
			#TODO pointsbefore set here, there is no need  for checking it !=nil in tests.show view
			answer.pointsBefore = test.points
			if(answer.save)
				 ActiveRecord::Base.logger.warn "Answer saved"
			else
				 ActiveRecord::Base.logger.warn "***********!!!!! ANSWER NOT SAVED !!!!"
			end		
			return true,false
		end

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



	def question_params
			params.require(:question).permit(:content, :answerTime, :correctAnswer, :difficulty, :luck, :imgFile, :course_id,  :keywords, :img
)
	end



	def authShowQuestionAlu(params, session)
		t = Test.find(params[:test_id])
		 #ActiveRecord::Base.logger.warn "*************AUTH RES*********************"  + (WorksHelper.studentCanViewWork(t.work_id, session[:useraccount_id]) && t.answers.pluck(:question_id).include?(params[:question_id].to_i).to_s)
		return WorksHelper.studentCanViewWork(t.work_id, session[:useraccount_id]) && t.answers.pluck(:question_id).include?(params[:question_id].to_i)
	
	end



end
