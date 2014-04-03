class EdgesController < ApplicationController
 before_filter(:only => [:new_src , :new_dest, :create , :update , :edit, :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

	layout :green_web



	def new_src
    @edge = Edge.new
		@edge.src_id = params[:src_id]
	end	

	def new_dest
    @edge = Edge.new
		@edge.dest_id = params[:dest_id]
	end	



  # GET /edges/1/edit
  def edit
    @edge = Edge.find_by_src_id_and_dest_id(params[:src_id] , params[:dest_id])
  end

  # POST /edges
  # POST /edges.xml
  def create
    @edge = Edge.new(edge_params)
		@edge.dep = 1
		nextController = params[:next]
		return if (not ["src", "dest"].include? nextController	)
		if Edge.find_by_src_id_and_dest_id(@edge.src_id, @edge.dest_id)	
        flash[:notice] = 'La relacion ya existe.'
		else	

      if @edge.save
        flash[:notice] = t('edge_created_success')
				redirect_to :controller => "nodes" , :action => "edit" , :id => eval("@edge.#{nextController}_id")
				return
      end
      end
      render :action => "new_#{nextController}" 
  end

  # PUT /edges/1
  # PUT /edges/1.xml
  def update
    @edge = Edge.find_by_src_id_and_dest_id(params[:edge][:src_id] , params[:edge][:dest_id])

      if @edge.update(edge_params)
        flash[:notice] = t('edge_updated_success')
				redirect_to :controller => "nodes" , :action => "listByCourse" , :course_id => @edge.src.course_id		
      else
        render :action => "edit" 
      end
  end

  # DELETE /edges/1
  # DELETE /edges/1.xml
  def destroy
    @edge = Edge.find_by_src_id_and_dest_id(params[:src_id] , params[:dest_id])
    @edge.destroy
		redirect_to :controller => "nodes" , :action => "listByCourse" , :course_id => @edge.src.course_id		

  end


	private

	def edge_params
			params.require(:edge).permit(:src_id, :dest_id, :dep)
	end


end
