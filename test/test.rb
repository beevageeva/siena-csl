
include Jabber
puts "Username:"
user = gets.chomp
puts "Password:"
pass = gets.chomp
puts "Tomessage:"
touser = gets.chomp

puts "username = #{user} , password = #{pass} , tomesage = #{touser}"	
connectres = Jabber.connect(user, pass)
if !connectres
	return
end
sid = connectres['sid']
rid = connectres['rid']
puts "1 , 2 ,3 q"
while true do
	c = gets.chomp
	case c
	when "1"
		res = Jabber.send_messages(rid,sid, [{:to => touser, :message => "heelloo #{touser} from #{user}"}])	
		rid = res['rid']
	when "3"
		res = Jabber.send_messages(rid,sid, [{:to => touser, :message => "heelloo #{touser} from #{user}"}] , "noise")	
		rid = res['rid']
	when "2"
		res = Jabber.send_messages(rid,sid)	
		rid = res['rid']
	when "q"
		Jabber.closesession(rid,sid)	
		break		
	end	
end

