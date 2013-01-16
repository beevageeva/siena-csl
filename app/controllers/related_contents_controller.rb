class RelatedContentsController < ApplicationController
 before_filter(:only => [:index] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }
 #before_filter(:only => [:listByNodeAndRecover] ) { |c| c.auth  [ {:types =>  [User::ALU]  }]  }
 before_filter(:only => [:show,:listByNodeAndRecover] ) { |c| c.auth nil }
 #NOW all teachers can modify , delete and craete any related content to the nodes	
 before_filter(:only => [:new, :create, :edit, :update, :destroy, :saveUploadFile, :uploadFile,  :deleteFile, :mainFile ] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }




	layout :green_web

  # GET /related_contents
  # GET /related_contents.xml
  def index
    @related_contents = initialize_grid(RelatedContent , {})
  end


	def listByNodeAndRecover
    @related_contents = RelatedContent.find(:all, {:conditions => ["node_id = #{params[:node_id]}  and recover = #{params[:recover]}  "]})
		render
	end


  # GET /related_contents/1
  # GET /related_contents/1.xml
  def show
    @related_content = RelatedContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @related_content }
    end
  end

  # GET /related_contents/new
  # GET /related_contents/new.xml
  def new
    @related_content = RelatedContent.new
		@related_content.node_id = params[:node_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @related_content }
    end
  end

  # GET /related_contents/1/edit
  def edit
    @related_content = RelatedContent.find(params[:id])
  end


	def uploadFile
    @related_content = RelatedContent.find(params[:related_content_id])
		render
	end


	def saveUploadFile
		file = params[:uploadFile]
		@related_content = RelatedContent.find(params[:id])
		if(file and  file!="")
			dirname = "#{RelatedContent::UPLOAD_DIR}/#{@related_content.id}"
			FileUtils.mkdir_p(dirname) unless File.exists?(dirname)
      #rename the file if contains no ascii chars
			newfilename = file.original_filename.tr("^a-zA-Z0-9_.-","_")
			newfilefullpath = File.join(dirname, newfilename)
			File.open(newfilefullpath, "wb") { |f| f.write(file.read) }
			if params[:decompress]
			#zip files
				 if newfilename =~ /.zip$/
					require 'zip/zipfilesystem'
					Zip::ZipFile.open(newfilefullpath) do |zipfile|
						zipfile.each do |file|
							fpath = File.join(dirname, file.to_s)
							#zip can have a dir path in the name
							FileUtils.mkdir_p(File.dirname(fpath))
							zipfile.extract(file , fpath ){true}
						end			
					end 
				end

			end
			if(params[:mainFile] || @related_content.uploadedFiles.size==0 )
				@related_content.filename = newfilename
				@related_content.save
			end
		end
    render :action => "edit" 
	end


	def deleteFile
    @related_content = RelatedContent.find(params[:related_content_id])
		@related_content.deleteFile(@related_content.uploadedFiles[params[:name].to_i])
		redirect_to :action => "edit" , :id => @related_content.id
	end

	def mainFile
    @related_content = RelatedContent.find(params[:related_content_id])
		@related_content.filename = @related_content.uploadedFiles[params[:name].to_i]
		@related_content.save
		render :action => "edit" 
	end

  # POST /related_contents
  # POST /related_contents.xml
  def create
    @related_content = RelatedContent.new(params[:related_content])
    if @related_content.save
      flash[:notice] = t('relatedcontent_created_success')
			redirect_to :action => "edit" , :id => @related_content.id
    else
       render :action => "new" 
    end
  end

  # PUT /related_contents/1
  # PUT /related_contents/1.xml
  def update
    @related_content = RelatedContent.find(params[:id])
      if @related_content.update_attributes(params[:related_content])
        flash[:notice] = t('relatedcontent_updated_success')
        redirect_to edit_related_content_path(@related_content) 
      else
         render :action => "edit" 
      end
  end

  # DELETE /related_contents/1
  # DELETE /related_contents/1.xml
  def destroy
    @related_content = RelatedContent.find(params[:id])
    @related_content.destroy
    dirname = "#{RelatedContent::UPLOAD_DIR}/#{@related_content.id}"
    FileUtils.rm_rf  dirname	
    redirect_to @related_content.node	  

end


  def view_as_html 
	rcid = params[:related_content_id]
	filename = params[:filename]	
	dirname = "#{RelatedContent::UPLOAD_DIR}/#{rcid}"
	if filename =~ /html$/ || filename =~ /htm$/
		ActiveRecord::Base.logger.warn("*******************noko")	
		doc =  Nokogiri::HTML(File.read(File.join(dirname,filename)))
		@html_head_section = doc.search("head")
		@html_body_section = doc.search("body")
		render :layout => 'related_contents'
	
	else
		send_file   File.join(dirname, filename)
	end
	
  end	


end
