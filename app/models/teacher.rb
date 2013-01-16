class Teacher < ActiveRecord::Base

	has_one :user, :as => :useraccount
	has_many :teacher_assigns , :dependent => :delete_all
  has_many :courses, :through => :teacher_assigns
	has_many :questions , :dependent => :delete_all
	has_many :nodes , :dependent => :delete_all

end
