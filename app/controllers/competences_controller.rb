class CompetencesController < ApplicationController
 before_filter(:only => [:index, :new, :create , :update , :edit, :show, :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }
 before_filter(:only => [:listByGroup , :listByGroups] ) { |c| c.auth  [ {:types =>  [User::ALU]  }]  }


	layout :green_web
  # GET /competences
  # GET /competences.xml
  def index
    @competences = Competence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competences }
    end
  end

  # GET /competences/1
  # GET /competences/1.xml
  def show
    @competence = Competence.find(params[:id])
		@alu_groups = AluGroup.includes(:competence_groups).where("competence_groups.competence_id = ?", @competence).references(:competence_groups).paginate(page: params[:page], per_page: 20).order('alu_groups.created_at DESC')
		@nodes = Node.includes(:competence_nodes).where("competence_nodes.competence_id = ?", @competence).references(:competence_nodes).paginate(page: params[:page], per_page: 20).order('nodes.created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competence }
    end
  end

	def listByGroups
		@alu_groups = AluGroup.includes(:student_alu_groups).where('student_alu_groups.student_id = ?', session[:useraccount_id]).references(:student_alu_groups).paginate(page: params[:page], per_page: 20).order('alu_groups.created_at DESC')
	end

	def listByGroup
		@competences = Competence.includes(:competence_groups).where('competence_groups.alu_group_id = ?', params[:alu_group_id]).references(:competence_groups).paginate(page: params[:page], per_page: 20).order('competences.created_at DESC')
	end

  # GET /competences/new
  # GET /competences/new.xml
  def new
    @competence = Competence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competence }
    end
  end

  # GET /competences/1/edit
  def edit
    @competence = Competence.find(params[:id])
		@alu_groups = AluGroup.includes(:competence_groups).where("competence_groups.competence_id = ?", @competence).references(:competence_groups).paginate(page: params[:page], per_page: 20).order('alu_groups.created_at DESC')
		@nodes = Node.includes(:competence_nodes).where("competence_nodes.competence_id = ?", @competence).references(:competence_nodes).paginate(page: params[:page], per_page: 20).order('nodes.created_at DESC')
  end

  # POST /competences
  # POST /competences.xml
  def create
    @competence = Competence.new(competence_params)

    respond_to do |format|
      if @competence.save
        flash[:notice] = t('competence_created_success')
        format.html { redirect_to(@competence) }
        format.xml  { render :xml => @competence, :status => :created, :location => @competence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @competence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /competences/1
  # PUT /competences/1.xml
  def update
    @competence = Competence.find(params[:id])

    respond_to do |format|
      if @competence.update(competence_params)
        flash[:notice] = t('competence_updated_success')
        format.html { redirect_to(@competence) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1
  # DELETE /competences/1.xml
  def destroy
    @competence = Competence.find(params[:id])
    @competence.destroy

    respond_to do |format|
      format.html { redirect_to(competences_url) }
      format.xml  { head :ok }
    end
  end



	private

	def competence_params
			params.require(:competence).permit(:name, :description)
	end


end
