# encoding: utf-8
class Notifier < ActionMailer::Base
 default :from => "admin@#{SienaCsl::Application.config.MAIL_DOMAIN}"



 def lost_password(email, username, password)
	@username = username
	@password = password
	 mail(:to => email, :subject => "Contrasena generada")	
   end


def student_question_to_teachers(emails,message,studentname,coursename)
	@message = message
	@studentname = studentname
	@coursename = coursename
	mail(:to => emails, :subject => "Pregunta")
end	



#notify admins methods
 def user_created( username)
	emails = User.where({:useraccount_type => User::ADMIN   , :active => true}).collect{|u| u.email}
	@username = username
	 mail(:to => emails, :subject => "Nuevo usuario creado")	
   end

	

 def no_work_assigned(node_id, student_id)
	emails = User.find(:all, :conditions => {:useraccount_type => User::ADMIN   , :active => true}).collect{|u| u.email}
	@node_id = node_id
	@student_id = student_id
	 mail(:to => emails, :subject => "El trabajo no estaba asignado")	
   end




end
