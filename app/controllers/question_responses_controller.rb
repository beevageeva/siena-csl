class QuestionResponsesController < ApplicationController
 before_filter(:only => [ :new, :create , :update , :edit, :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

layout :green_web


  # GET /question_responses/new
  # GET /question_responses/new.xml
  def new
    @question_response = QuestionResponse.new
    @question_response.question_id  = params[:question_id]
		render :action => 'new'
  end

  # GET /question_responses/1/edit
  def edit
    @question_response = QuestionResponse.find(params[:id])
  end

  # POST /question_responses
  # POST /question_responses.xml
  def create
    @question_response = QuestionResponse.new(qr_params)

      if @question_response.save
				@question = @question_response.question
				render :action => 'list' 
        flash[:notice] = t('questionresponse_created_success') 
      else
        render :action => "new" 
      end
			
  end

  # PUT /question_responses/1
  # PUT /question_responses/1.xml
  def update
    @question_response = QuestionResponse.find(params[:id])

			@question = @question_response.question
      if @question_response.update(qr_params)
        flash[:notice] = t('questionresponse_updated_success')
				render :action => 'list' 
      else
        render :action => "edit" 
      end
  end

  # DELETE /question_responses/1
  # DELETE /question_responses/1.xml
  def destroy
    @question_response = QuestionResponse.find(params[:id])
    @question_response.destroy
		@question = @question_response.question
		render :action => 'list' 
  end


	private

	def qr_params
			params.require(:question_response).permit(:response, :question_id)
	end


end
