class TeacherAssignsController < ApplicationController
 before_filter(:only => [:listByCourse] ) { |c| c.auth  [ {:types =>  [User::PROF,  User::ADMIN]  }]  }
 before_filter(:only => [:enroll] ) { |c| c.auth  [ {:types =>  [User::PROF]  }]  }
 before_filter(:only => [:assign_to_course] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }
 before_filter(:only => [:destroy ] ) { |c| c.auth  [ {:types =>  [User::PROF] , :condition => lambda{|params,session| TeacherAssign.find(params[:id]).teacher_id == session[:useraccount_id] } } , {:types => [User::ADMIN]} ]  }

layout :green_web

#include ChatHelper

	def listByCourse
		@teacher_assigns = TeacherAssign.includes(:teacher).where(course_id: params[:course_id]).paginate(page: params[:page], per_page: 20).order('created_at DESC')
	end


	#rails3 create cannot be used in routes
  def enroll
	TeacherAssign.where(teacher_id: session[:useraccount_id], course_id: params[:course_id]).first_or_create
    flash[:notice] = 'Profesor matriculado .'
    redirect_to(courses_url)
  end
  def assign_to_course
		t = TeacherAssign.where(teacher_id: params[:teacher_id], course_id: params[:course_id]).first_or_create
		if(params[:coord].nil?)
			t.coordinator = false
		else	
			t.coordinator = params[:coord]
		end
		t.save	
		flash[:notice] = 'Profesor matriculado .'
		redirect_to :action => :listByCourse, :course_id => params[:course_id]
  end

	def changeCoordinator
    teacher_assign = TeacherAssign.find(params[:id])
		teacher_assign.coordinator = !teacher_assign.coordinator
		teacher_assign.save
    flash[:notice] = 'Coordinador cambiado .'
		redirect_to :action => :listByCourse, :course_id => params[:course_id]

	end

  # DELETE /teacher_assigns/1
  # DELETE /teacher_assigns/1.xml
  def destroy
    @teacher_assign = TeacherAssign.find(params[:id])
    @teacher_assign.destroy
		#chat_delete_teacher_from_course(@teacher_assign.teacher, @teacher_assign.course)

    redirect_to(courses_url)
  end
end
