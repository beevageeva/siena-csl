module ChatMessagesHelper

#	def ChatMessagesHelper.getChatMessagesTable(alugroup, condf)
#		msgtable = Hash.new
#		alugroup.users.each do |u1|
#			msgtable[u1.username] = Hash.new
#			alugroup.users.each do |u2|
#				msgtable[u1.username][u2.username] = ChatMessage.where(condf.call(u1.username,u2.username)).count	if u2.id != u1.id
#			end
#		end
#		return msgtable
#	end

	def ChatMessagesHelper.getChatMessagesList(alugroup, testid)
		msgtable = Hash.new
		alugroup.students.each do |s|

			#ActiveRecord::Base.logger.warn "**********s.id #{s.id}"
			#ActiveRecord::Base.logger.warn "*********Test id  #{testid}"


			nmsgs = (ChatMessage.joins(:grouptest_chatmessages).where(:from_id => s.id, :grouptest_chatmessages => {:test_id => testid}).select("distinct (from_id, body)" ).count) 
			msgtable[s.user.username] = nmsgs
		end
		#ActiveRecord::Base.logger.warn "MSGLIST"
		#ActiveRecord::Base.logger.warn msgtable
		return msgtable
	end



	#fn is file full path  without extension, afterwards a fn.dot and fn.png created
#	def ChatMessagesHelper.generatePngChat(msgtable,fn)
#		t = "digraph G {\n"
#		msgtable.each_key do |username1|
#			t << username1
#			t << "[label=\"#{username1}\"]"
#		end
#		msgtable.each_key do |username1|
#			msgtable[username1].each do |username2, nmsg|
#				t << username1
#				t << " -> "
#				t << username2
#				t << "[label=\"#{nmsg}\"]"
#				t << "\n"
#			end
#		end
#		t<<"}\n"
#		f = File.open(fn + ".dot" , 'w')
#	  f.write(t)
#	  f.close
#		`dot -Tpng  #{fn}.dot -o #{fn}.png`
#	end


	#TODO? calculate this in the same time as msgtable
	#calculate (1 - desviacion estandar/media)
	#deviacion estandar = (sum(i,j) (xij - media)**2 ) / nmsg  nmsg es numero total de mensajes
	#media = nmsgtotal / n
	#n = nu**2 - nu   (nu num de users in alugroup)
	#xij num mensajes enviados de usario i a usuario j
#	def ChatMessagesHelper.calculateCoef(msgtable)
#		res = [0,0,1]
#		n = msgtable.size  * (msgtable.size - 1)
#		nmsgtotal = 0
#		msgtable.each_key do |username1|
#			msgtable[username1].each do |username2, nmsg|
#				nmsgtotal +=	nmsg 
#			end
#		end
#		return res if nmsgtotal == 0
#		media = nmsgtotal / n.to_f
#		ActiveRecord::Base.logger.warn   "nmsgtotal=#{nmsgtotal} , n=#{n} , media=#{media}"
#		return res if media == 0
#		res[0] = media	
#		des = 0
#		msgtable.each_key do |username1|
#			msgtable[username1].each do |username2, nmsg|
#				des +=	(nmsg - media)**2
#			end
#		end
#		ActiveRecord::Base.logger.warn   "des before /n=#{des} "
#		des /= nmsgtotal.to_f
#		des = Math.sqrt(des)
#		ActiveRecord::Base.logger.warn   "des after /n and sqrt=#{des} "
#		res[1] = des
#		res[2] = 1 - des/media.to_f
#		ActiveRecord::Base.logger.warn   "des /media=#{des/media} "
#		return res
#	end

end
