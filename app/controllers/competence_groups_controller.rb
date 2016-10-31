require 'works_helper'
require 'file_helper'


class CompetenceGroupsController < ApplicationController

	include WorksHelper

 before_filter(:only => [:index, :show ,:newAluGroup, :create , :update , :edit , :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

	layout :green_web


  # GET /competence_groups
  # GET /competence_groups.xml
  def index
    @competence_groups = CompetenceGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competence_groups }
    end
  end

  # GET /competence_groups/1
  # GET /competence_groups/1.xml
  def show
    @competence_group = CompetenceGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competence_group }
    end
  end

  # GET /competence_groups/new
  # GET /competence_groups/new.xml
  def newAluGroup
    @competence_group = CompetenceGroup.new
		@competence_group.competence_id = params[:competence_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competence_group }
    end
  end

	def uploadFile
  if !(modifyCompetence?(params[:alu_group_id]))
      flash[:notice] = "You must login"
      redirect_to(login_url)
      return
    end
		@competence_group = CompetenceGroup.find_by_competence_id_and_alu_group_id(params[:competence_id] , params[:alu_group_id])
	end	



  # GET /competence_groups/1/edit
  def edit
    @competence_group = CompetenceGroup.find(params[:id])
  end

  # POST /competence_groups
  # POST /competence_groups.xml
  def create
		if CompetenceGroup.find_by_competence_id_and_alu_group_id(params[:competence_group][:competence_id],params[:competence_group][:alu_group_id])
        flash[:notice] = 'El grupo ya existe.'
				redirect_to :controller => 'competences' , :action => 'edit' , :id => params[:competence_group][:competence_id]
				return
		
		end
    @competence_group = CompetenceGroup.new(cg_params)

      if @competence_group.save
				#assign works to all users of groups		
				#TODO new method 	 all students of group
		worktype = Work::TEST_TYPE
		@competence_group.competence.nodes.each do |n|
		node_id = n.id
		@competence_group.alu_group.students.each do |s|
			if not Work.where(student_id: s.id, node_id: node_id)
				Work.new(:node_id => node_id , :initialpoints => params[:initialpoints], :student_id => s.id, :worktype => worktype).save
			end
			#successors
			nodes = Array.new
			getNodesRecursive(Work::ASSIGNEDTOSTUDENT, s.id, node_id, nodes)
			nodes.each do |n|
				if not Work.where(student_id: s.id, node_id: n.id)
					Work.new(:node_id => n.id , :initialpoints => params[:initialpoints], :student_id => s.id, :worktype => worktype).save
				end
			end
		end
		end
	
        flash[:notice] = t('competencegroup_created_success') 
				redirect_to :controller => 'competences' , :action => 'edit' , :id => @competence_group.competence_id
      else
         render :action => "newAluGroup" 
      end
  end

  # PUT /competence_groups/1
  # PUT /competence_groups/1.xml
  def update
    @competence_group = CompetenceGroup.find(params[:id])

    respond_to do |format|
      if @competence_group.update_attributes(cg_params)
        flash[:notice] = t('competencegroup_updated_success') 
        format.html { redirect_to(@competence_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competence_group.errors, :status => :unprocessable_entity }
      end
    end
  end


	def saveUploadFile
	#TODO put in before_filter
    @competence_group = CompetenceGroup.find(params[:id])
  if !(modifyCompetence?(@competence_group.alu_group_id))
      flash[:notice] = "You must login"
      redirect_to(login_url)
      return
    end
		FileHelper.uploadFileCheckSize(params[:filename], CompetenceGroup::UPLOAD_DIR, @competence_group, 'filename')
		@competence_group.save
		redirect_to :controller => 'competences' , :action => 'listByGroup' , :alu_group_id => @competence_group.alu_group_id

	end


  # DELETE /competence_groups/1
  # DELETE /competence_groups/1.xml
  def destroy
    @competence_group = CompetenceGroup.find(params[:id])
    @competence_group.destroy
		redirect_to :controller => 'competences' , :action => 'edit' , :id => @competence_group.competence_id
  end


	private
		def modifyCompetence?(alu_group_id)
				AluGroup.find(alu_group_id).users.each do |u|
					return true if session[:userid] == u.id
				end	
				return false
		end


	  def cg_params
	      params.require(:competence_group).permit(:filename, :points, :competence_id, :alu_group_id)
	  end



end
