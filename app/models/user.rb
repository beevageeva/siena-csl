class User < ActiveRecord::Base


 belongs_to :useraccount, :polymorphic => true , :dependent => :destroy






  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :name
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_format_of :username, :with => /\A([a-z0-9_]+)\Z/i


	ADMIN="Admin"
	PROF="Teacher"
	ALU="Student"

	USER_TYPES = [ADMIN , PROF , ALU]

	attr_reader :password

  def password=(pw)
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash =
      salt, Digest::MD5.hexdigest(pw + salt)
  end

  def password_is?(pw)
    Digest::MD5.hexdigest(pw + password_salt) == password_hash
  end





end
