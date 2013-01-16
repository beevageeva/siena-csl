module UsersHelper
	def getUserAccountOptions
			res = Hash.new
			User::USER_TYPES.each do |type|
				res[t("userType" + type.to_s)] = type 
			end
			return res
	end




end
