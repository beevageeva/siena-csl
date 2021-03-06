SienaCsl::Application.configure do

	#config.relative_url_root = '/siena2' TODO NOT WORKING
	#config.action_controller.relative_url_root = '/siena2'

  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false


  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false


	#MAILER CONFIG
  # Don't care if the mailer can't send
  #config.action_mailer.raise_delivery_errors = false
  config.action_mailer.raise_delivery_errors = true
	config.action_mailer.perform_deliveries = true
	#TODO ruby 1.9 You're trying to use 1.9 hash syntax (key: value) with a 1.8 Ruby (key => value).
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
  	:address   =>        'localhost',
	  :port      =>           25,
		:openssl_verify_mode  => 'none'
	}
	#config.action_mailer.delivery_method = :sendmail
	# Defaults to:
	# config.action_mailer.sendmail_settings = {
	#   location: '/usr/sbin/sendmail',
	#   arguments: '-i -t'
	# }

	#END MAILER CONFIG


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
	#rails4
  #config.active_record.mass_assignment_sanitizer = :strict
	config.eager_load = true

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
	#rails4
  #config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  #config.log_level = :debug #log file for ActiveRecord::Base.logger is log/development.log
  config.log_level = :warn #log file for ActiveRecord::Base.logger is /var/log/apache2/error.log



#TODO
#	DEPRECATION WARNING: It looks like you are eager loading table(s) (one of: questions, nodes) that are referenced in a string SQL snippet. For example: 
#
#    Post.includes(:comments).where("comments.title = 'foo'")
#
#Currently, Active Record recognizes the table in the string, and knows to JOIN the comments table to the query, rather than loading comments in a separate query. However, doing this without writing a full-blown SQL parser is inherently flawed. Since we don't want to write an SQL parser, we are removing this functionality. From now on, you must explicitly tell Active Record when you are referencing a table from a string:
#
#    Post.includes(:comments).where("comments.title = 'foo'").references(:comments)
#
#If you don't rely on implicit join references you can disable the feature entirely by setting `config.active_record.disable_implicit_join_references = true`.

	#config.active_record.disable_implicit_join_references = true


end
