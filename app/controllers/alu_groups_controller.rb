class AluGroupsController < ApplicationController

 before_filter(:only => [:new, :create , :update , :edit, :destroy, :listByCourse, :show] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }
 before_filter(:only => [:listByStudentAndCourse] ) { |c| c.auth  [ {:types =>  [User::ALU] , :condition => lambda{|params,session| params[:student_id] == session[:useraccount_id].to_s  }  }, {:types => [User::PROF] }]  }


	layout :green_web

	def listByCourse
			@alu_groups = AluGroup.where(course_id: params[:course_id]).paginate(page: params[:page], per_page: 20).order(created_at: :desc)
	end

	def listByStudentAndCourse
		student = Student.find(params[:student_id])
		@alu_groups = student.alu_groups.where(:course_id => params[:course_id] )
	end

  # GET /alu_groups/1
  # GET /alu_groups/1.xml
  def show
	@alu_group = AluGroup.find(params[:id])
	@students = Student.joins(:user,:student_alu_groups).where(:student_alu_groups => {:alu_group_id => params[:id]} ).includes(:user).paginate(page: params[:page], per_page: 20)
  end

  def new
	@alu_group = AluGroup.new
	@alu_group.course_id = params[:course_id]
  end



  # GET /alu_groups/1/edit
  def edit
	@alu_group = AluGroup.find(params[:id])
	@students = Student.joins(:user,:student_alu_groups).where(:student_alu_groups => {:alu_group_id => params[:id]} ).includes(:user).paginate(page: params[:page], per_page: 20)
  end

  # POST /alu_groups
  # POST /alu_groups.xml
  def create
    @alu_group = AluGroup.new(alu_group_params)

    respond_to do |format|
      if @alu_group.save
        flash[:notice] = t('alugroup_created_success')
        format.html { redirect_to(@alu_group) }
        format.xml  { render :xml => @alu_group, :status => :created, :location => @alu_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alu_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alu_groups/1
  # PUT /alu_groups/1.xml
  def update
    @alu_group = AluGroup.find(params[:id])

    respond_to do |format|
      if @alu_group.update(alu_group_params)
        flash[:notice] = t('alugroup_updated_success')
        format.html { redirect_to(@alu_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alu_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alu_groups/1
  # DELETE /alu_groups/1.xml
  def destroy
    @alu_group = AluGroup.find(params[:id])
    @alu_group.destroy
		 redirect_to :controller=>"alu_groups", :action => "listByCourse",:course_id => @alu_group.course_id
  end



	private

	def alu_group_params
			params.require(:alu_group).permit(:name, :course_id)
	end

end
