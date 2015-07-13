require "courses_helper"
#require "courses_grid"

class CoursesController < ApplicationController

 before_filter(:only => [:show , :index] ) { |c| c.auth nil  }
 before_filter(:only => [:new, :create,:edit, :update , :destroy, :export, :import, :saveImport ] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }
 before_filter(:only => [:indexAssigned] ) { |c| c.auth  [ {:types =>  [User::ALU, User::PROF]  }]  }
 before_filter(:only => [:createPng, :allStudents ] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

layout :green_web

include CoursesHelper

  # GET /courses
  # GET /courses.xml
  def index
#		ActiveRecord::Base.logger.warn("REQUEST HEADERS")
#			request.headers.each do |header|
#			ActiveRecord::Base.logger.warn 	header	
#		end
#
#		ActiveRecord::Base.logger.warn("REQUEST HEADERS END")

    #@grid = CoursesGrid.new(params[:courses_grid])
    #@courses = @grid.assets.page(params[:page])
    #@courses = @grid.assets.paginate(:page => params[:page], :per_page => 20)
		@courses = initialize_grid(Course, { :order => "created_at" , :order_direction => 'desc' } )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  def indexAssigned
		accounttype = underscore(User.find(session[:userid]).useraccount_type)
		@courses = initialize_grid(Course, {:conditions => ["#{accounttype}_assigns.#{accounttype}_id = #{session[:useraccount_id]}"]  , :include => ["#{accounttype}_assigns".to_sym] , :order => "name"  } )
		render
  end

  def allStudents
		@students = Course.find(params[:course_id]).students
		render
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])
		@hasPng = File.exists?(File.join(CoursesHelper::MAPIMAGESDIR, @course.id.to_s + '.png'))
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

	def import
		render
	end


  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        flash[:notice] = t('course_created_success')
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update(course_params)
        flash[:notice] = t('course_updated_success')
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

	def createPng
    @course = Course.find(params[:id])
		if generatePng(@course)
			flash[:notice] = 'Imagen generada'
		else
			flash[:notice] = 'Imagen NO generada'
		end
		redirect_to :action => "show" , :id => @course.id
	end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end

	def export
		course = Course.find(params[:course_id])
		 headers['Content-Type'] = 'application/xhtml+xml; charset=utf-8'
		#render :xml => (course.to_xml :include =>  {:alu_groups => {:include => :user_alu_group} , :nodes => {:include => :works} , :questions => {:include => [:node_question_relations, :question_responses]} , :teacher_assigns => {:include => {:teacher => {:include => :user}} } , :student_assigns => {:include => {:student => {:include => :user}} }}   , :dasherize => false , :except => [:created_at, :updated_at])
		render :xml => (course.to_xml :include =>  {:nodes => {:include => :works }  , :questions => {:include => [:node_question_relations, :question_responses]} , :teachers => {:include =>:user } , :students =>  {:include => :user}, :alu_groups => {:include => :students  } }    , :dasherize => false , :except => [:created_at, :updated_at])

	end
	
	def saveImport
		file = params[:xmlFile]
		if file
			result = importFromXML(file)
			ActiveRecord::Base.logger.warn "***********************LOGGINGgg---------------------"
			flash[:notice]  = "Imported #{result}"
 		else
			flash[:notice]  = "No file"
		end
		redirect_to :action => "index"
	end

	private

	def course_params
			params.require(:course).permit(:name)
	end

end
