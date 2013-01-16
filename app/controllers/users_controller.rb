# encoding: utf-8
class UsersController < ApplicationController


 before_filter(:only => [:edit , :update , :show ] ) { |c| c.auth  [ {:types =>  [User::ALU, User::PROF] , :condition => lambda{|params,session| params[:id].to_i == session[:userid]} } , {:types => [User::ADMIN]} ]  }
 before_filter(:only => [:chPw,:updateChPw ] ) { |c| c.auth  [ {:types =>  [User::ALU, User::PROF] , :condition => lambda{|params,session| params[:userid].to_i == session[:userid]} } , {:types => [User::ADMIN]} ]  }
 before_filter(:only => [:destroy, :changeActive , :index, :loginAs, :indexNotActive, :activateMultiple] ) { |c| c.auth  [ {:types =>  [User::ADMIN]  }]  }

	layout :green_web



  # GET /users
  # GET /users.xml
  def index
		@users = initialize_grid(User, {})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
 
 def indexNotActive
		@users = initialize_grid(User, {:conditions => ["active = ?" ,  false]})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end


        def get_lost_password
                render 
        end

        def lost_password
	ActiveRecord::Base.logger.warn("LOST PASSWORD")
	if simple_captcha_valid?
		ActiveRecord::Base.logger.warn("simple captcha vlid")
                username = params[:username]
                password  = [Array.new(8){rand(256).chr}.join].pack("m").chomp
                user = User.find_by_username(username)
                if user
                        user.password = password
                        if(user.save)
                                Notifier.lost_password(user.email,username, password).deliver
                                flash[:notice] =  'Contraseña enviada a la dirección de correo asociada'
                        else
                                flash[:notice] = 'No se ha podido generar una nueva contraseña'
                        end
                else
                        flash[:notice] = "No existe el usuario #{username}"
			render 'get_lost_password'
			return	
                end
	else	
               flash[:notice] = "Captcha not valid"
		render 'get_lost_password'
		return
	end
                redirect_to :action => 'getUserHome'
        end



  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  def chPw
    @user = User.find(params[:userid])
  end

  # POST /users
  # POST /users.xml
  def create
	@user = User.new(params[:user])
	if simple_captcha_valid?

		User.transaction do
			useraccount = eval(@user.useraccount_type).new
			if useraccount.save
				@user.useraccount_id = useraccount.id
				@user.active = false
    				if @user.save
        				flash[:notice] = t('user_created_success')
					redirect_to :action => "getUserHome"
					Notifier.user_created(@user.username).deliver
				else
					#IMPORTANT render before exception
					render :action => 'new'
					raise  ActiveRecord::Rollback 
    				end
			end
		end
	else
		flash[:notice] = "Captcha not valid"
		render :action => 'new'
	end
  end






	def activateMultiple
		users = User.where(:id => params[:grid][:userids])
		users.each do |u|
			u.active = true
			u.save
		end	
		redirect_to(users_url)	
	end

	def changeActive
		@user = User.find(params[:userid])

		@user.active = (! @user.active)
    if @user.save
      flash[:notice] = 'Estado cambiado.'
     else
			ActiveRecord::Base.logger.warn   "errors saving user" 
			@user.errors.each{|attr,msg|  ActiveRecord::Base.logger.warn   "#{attr} - #{msg}" }
      flash[:notice] = 'Estado no cambiado.'
		end
		redirect_to(users_url)	
	end

 	def verifyLogin
	     @user = User.find_by_username_and_active(params[:login] ,  true)
      if @user and @user.password_is? params[:password]
				#TODO user should not be kept in the session because it can be modified (when user changes the profile session user should be loaded again)
				 session[:userid] = @user.id
				session[:useraccount_id] = @user.useraccount_id
         flash[:notice] = t('user_login_ok')
      else
         flash[:notice] = "Usuario, contraseña incorrectos o usuario no activo"
      end
       redirect_to :controller => 'users' ,  :action => "getUserHome"

 	end			
 	def loginAs
				 session[:userid] = params[:userid]
				session[:useraccount_id] = User.find(params[:userid]).useraccount_id
         flash[:notice] = t('user_login_ok')
       redirect_to :controller => 'users' ,  :action => "getUserHome"

 	end			


	def login
		render
	end

	def logout
		session.clear()
    redirect_to :controller => 'users' , :action => 'getUserHome'
	end



	def help
		render :template => "static/#{ session[:locale].nil? ? I18n.default_locale : session[:locale]  }/help"
	end




	def getUserHome
		render :template => "static/#{ session[:locale].nil? ? I18n.default_locale : session[:locale]  }/home"
	end


def set_locale
	if(params[:locale].nil?)
		locale = nil
	else	
		
	locale = params[:locale].to_sym
	locale = nil if (!I18n.available_locales.include? locale)
	end
	locale =  I18n.default_locale if locale.nil?
	session[:locale] = locale
	if request.env["HTTP_REFERER"]	
		redirect_to :back
	else
	   redirect_to :controller => 'users' ,  :action => "getUserHome"
	end
end 


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = t('user_updated_success')
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def chPwUpdate
    @user = User.find(params[:userid])
    if @user.update_attributes(params[:user])
			#chat_change_password(@user.username, params[:user][:password])
      flash[:notice] = 'Contraseña cambiada correctamente.'
      redirect_to(edit_user_path(@user)) 
    else
      render :action => "chPw" 
    end
  end


  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
		#chat_unregister(@user.username)

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end



	def changeTheme
		if ApplicationHelper::GREEN_THEMES.include?(params[:theme])
			session[:layout] = params[:theme]
		end
		if request.env["HTTP_REFERER"]	
			redirect_to :back
		else
	    redirect_to :controller => 'users' ,  :action => "getUserHome"
		end
	end




end
