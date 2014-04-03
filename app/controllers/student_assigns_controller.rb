class StudentAssignsController < ApplicationController

 before_filter(:only => [:listByCourse] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }
 before_filter(:only => [:enroll] ) { |c| c.auth  [ {:types =>  [User::ALU]  }]  }
 before_filter(:only => [:listByCourseNot, :register_to_course, :unregister_from_course] ) { |c| c.auth  [ {:types =>  [ User::ADMIN]  }]  }
 before_filter(:only => [:destroy ] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| StudentAssign.find(params[:id]).student_id == session[:useraccount_id] } } , {:types => [User::ADMIN]} ]  }


layout :green_web



	def listByCourse
			students = Student.arel_table
			student_assigns = StudentAssign.arel_table
			students_condition = StudentAssign.where(student_assigns[:course_id].eq(params[:course_id]).and(student_assigns[:student_id].eq(students[:id]))).exists
			students_relation = Student.where(students_condition).includes(:user)
			@students = initialize_grid(students_relation)
			render :action => "listByCourse#{User.find(session[:userid]).useraccount_type}"
	end

	def listByCourseNot
			students = Student.arel_table
			student_assigns = StudentAssign.arel_table
			students_condition = StudentAssign.where(student_assigns[:course_id].eq(params[:course_id]).and(student_assigns[:student_id].eq(students[:id]))).exists.not
			students_relation = Student.where(students_condition).includes(:user)
			@students = initialize_grid(students_relation)

	end


 def enroll
    @student_assign = StudentAssign.find_or_create_by_student_id_and_course_id( session[:useraccount_id],  params[:course_id])
        flash[:notice] = 'Alumno matriculado.'
        redirect_to(courses_url)
  end




  def register_to_course
	params[:grid][:studentids].each do |sid|
		StudentAssign.find_or_create_by_student_id_and_course_id(sid,  params[:course_id] )
	end	
	redirect_to :controller => 'student_assigns' , :action => 'listByCourse', :course_id => params[:course_id]	
  end

  def unregister_from_course
	params[:grid][:studentids].each do |sid|
		sa = StudentAssign.find_by_student_id_and_course_id(sid,  params[:course_id] )
		sa.destroy
	end	
	redirect_to :controller => 'student_assigns' , :action => 'listByCourse', :course_id => params[:course_id]	
  end

  # DELETE /student_assigns/1
  # DELETE /student_assigns/1.xml
  def destroy
    @student_assign = StudentAssign.find(params[:id])
    @student_assign.destroy
    redirect_to(courses_url)

  end
	private

	def sa_params
			params.require(:student_assign).permit(:student_id)
	end

end
