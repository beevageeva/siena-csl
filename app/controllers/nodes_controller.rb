require 'nodes_helper'

class NodesController < ApplicationController


include NodesHelper

before_filter(:only => [:edit, :update , :destroy ] ) { |c| c.auth  [ {:types =>  [User::PROF] , :condition => lambda{|params,session| Node.find(params[:id]).teacher_id == session[:useraccount_id]} } , {:types => [User::ADMIN]} ]  }
before_filter(:only => [:new, :create , :listByCourse, :show, :importFromCompendium, :saveImportFromCompendium] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } ]  }
 before_filter(:only => [:index] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }

layout :green_web

  # GET /nodes
  # GET /nodes.xml
  def index
		@nodes = initialize_grid(Node , {:include => ["course"]})
  end

	def listByCourse
		@nodes = initialize_grid(Node , {:conditions => ["course_id = #{params[:course_id]}"]})
	end


  # GET /nodes/1
  # GET /nodes/1.xml
  def show
    @node = Node.find(params[:id])
		@questions = initialize_grid(Question, {:conditions => ['node_question_relations.node_id = ?', @node], :include => [:node_question_relations]})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.xml
  def new
    @node = Node.new
		@node.course_id = params[:course_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.find(params[:id])
		@questions = initialize_grid(Question, {:conditions => ['node_question_relations.node_id = ?', @node], :include => [:node_question_relations]})
  end

  # POST /nodes
  # POST /nodes.xml
  def create
    @node = Node.new(node_params)
	if User.find(session[:userid]).useraccount_type == User::PROF
		@node.teacher_id = session[:useraccount_id]
	else
		@node.teacher_id = Teacher.limit(1).pluck("id").first

	end
      if @node.save
        flash[:notice] = t('node_created_success')
        redirect_to edit_node_path(@node) 
      else
        render :action => "new" 
      end
  end

  # PUT /nodes/1
  # PUT /nodes/1.xml
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update(node_params)
        flash[:notice] = t('node_updated_success')
        format.html { redirect_to(@node) }
        format.xml  { head :ok }
      else
				@questions = initialize_grid(Question, {:conditions => ['node_question_relations.node_id = ?', @node], :include => [:node_question_relations]})
        format.html { render :action => "edit" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.xml
  def destroy
    @node = Node.find(params[:id])
    @node.destroy
		redirect_to :action => "listByCourse" , :course_id => @node.course_id

  end


	def importFromCompendium
		render
	end

	def saveImportFromCompendium
		#todo authoriz
		file = params[:mapFile]	
		if file
			if User.find(session[:userid]).useraccount_type == User::PROF
				#Teacher account
				teacher_id = session[:useraccount_id]
			else
				#admin account
				teacher_id = Teacher.limit(1).pluck("id").first
			end

			relatedContentFiles = importCompendiumMap(file.path, teacher_id, params[:course_id])
			
			flash[:notice] = "Mapa importado"
		else
			flash[:notice] = "Error importando mapa"
		end
		flash[:notice] << "<br/>Los siguente ficheros especificados como contenidos? " if relatedContentFiles.size > 0
		relatedContentFiles.each do |fn|
			flash[:notice] << "<br/>#{fn}"
		end
		redirect_to :action => "listByCourse" , :course_id => params[:course_id]
	end

	private

	def node_params
			params.require(:node).permit(:content, :course_id, :minPasspoints)
	end

end
