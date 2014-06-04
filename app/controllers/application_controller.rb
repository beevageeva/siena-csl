# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

	protect_from_forgery
	#captcha
	#include SimpleCaptcha::ControllerHelpers
	#recaptcha
	include ReCaptcha::AppHelper


	layout :green_web

  helper :all # include all helpers, all the time
	before_filter :setLocale 



  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '217e32c997e9524dcefdc37cab27764f'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password



	def auth(typeMethods)
    mustLogin = (not isValid(typeMethods))
    if mustLogin  
      flash[:notice] = "You must login"
      redirect_to(login_url)
    end
    return mustLogin
	end




def redirect_to(options = {}, response_status = {})
  if request.xhr?
    render(:update) {|page| page.redirect_to(options)}
  else
    super(options, response_status)
  end
end




  def isValid(typeMethods)
    return false if  session[:userid].nil? 
    return true if typeMethods.nil?
    userType = User.find(session[:userid]).useraccount_type
    typeMethods.each do |tm|
      tm[:types].each do |x|
        if x==userType
          return true if tm[:condition].nil? or tm[:condition].call(params, session)
        end
      end
    end
    return false
  end




	protected 
		def green_web
			 if session[:layout] and ApplicationHelper::GREEN_THEMES.include?(session[:layout])
				return session[:layout]
			end
				
			 if  SienaCsl::Application.config.DEFAULT_THEME 
				return SienaCsl::Application.config.DEFAULT_THEME
			end	

			return ApplicationHelper::GREENWEB_THEME
		end

	def setLocale 
		if session[:locale].nil?
			if  SienaCsl::Application.config.DEFAULT_LANGUAGE
				I18n.locale = SienaCsl::Application.config.DEFAULT_LANGUAGE
			else
				I18n.locale = I18n.default_locale
			end
		else
			I18n.locale = session[:locale]
		end
	end

end
