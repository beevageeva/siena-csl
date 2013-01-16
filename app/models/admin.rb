class Admin < ActiveRecord::Base

	 has_one :user, :as => :useraccount

end
