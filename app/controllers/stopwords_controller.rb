class StopwordsController < ApplicationController

 before_filter { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

  def new
    @stopword = Stopword.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stopword }
    end
  end


  def create
    @stopword = Stopword.new(stopword_params)
    respond_to do |format|
      if @stopword.save
        flash[:notice] = t('stopword_created_success')
        format.html { redirect_to(stopwords_url) }
        format.xml  { render :xml => @stopword, :status => :created, :location => @stopword }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stopword.errors, :status => :unprocessable_entity }
      end
    end
  end



  def index
		@stopwords = initialize_grid(Stopword, { :order => "word" } )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stopwords }
    end
  end

  def destroy
    @stopword = Stopword.find(params[:id])
    @stopword.destroy

    respond_to do |format|
      format.html { redirect_to(stopwords_url) }
      format.xml  { head :ok }
    end
  end

	private

	def stopword_params
			params.require(:stopword).permit(:word)
	end

end
