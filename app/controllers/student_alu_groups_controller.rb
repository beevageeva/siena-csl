class StudentAluGroupsController < ApplicationController
 before_filter(:only => [:newStudent, :create , :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }


	layout :green_web



  # GET /student_alu_groups/new
  # GET /student_alu_groups/new.xml
  def newStudent
    @student_alu_group = StudentAluGroup.new
		@student_alu_group.alu_group_id = params[:alu_group_id]
  end


  # POST /student_alu_groups
  # POST /student_alu_groups.xml
  def create
		if StudentAluGroup.find_by_student_id_and_alu_group_id(params[:student_alu_group][:student_id] , params[:student_alu_group][:alu_group_id])
        flash[:notice] = 'El usuario ya existe.'
				redirect_to :controller => 'alu_groups' , :action => 'edit' , :id => params[:student_alu_group][:alu_group_id]
				return
		
		end
    @student_alu_group = StudentAluGroup.new(params[:student_alu_group])

      if @student_alu_group.save
        flash[:notice] = t('student_alu_group_created_success')
				redirect_to :controller => 'alu_groups' , :action => 'edit' , :id => @student_alu_group.alu_group_id
      else
         render :action => "new" 
      end
  end


  # DELETE /student_alu_groups/1
  # DELETE /student_alu_groups/1.xml
  def destroy
    @student_alu_group = StudentAluGroup.find(params[:id])
    @student_alu_group.destroy
		redirect_to :controller => 'alu_groups' , :action => 'edit' , :id => @student_alu_group.alu_group_id
  end
end
