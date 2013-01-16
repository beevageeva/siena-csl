namespace :install do

	desc "Activate user"
	task :activate , :username, :needs => :environment  do |t, args|
		args.with_defaults(:username => "admin")
		u = User.find_by_username(args.username)
		if u.nil?
			puts "User #{args.username} does not exist"
		else
			u.active = true
			if(u.save)
				puts "User #{args.username} activated"
			else
				puts "User #{args.username} not activated"
			end
		end
	end
	
end
