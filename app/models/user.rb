class User < ActiveRecord::Base
	has_many :orders

	has_secure_password

	validates_presence_of :password_digest, :email, :role
	validates_uniqueness_of :email

	before_save :set_secure_token

	ROLES = ["customer", "collector", "admin"]

	def check_session_expire
		if !self.secure_token_expire.nil && DateTime.now > self.secure_token_expire
			return true
		else
			return false
		end
	end

	def set_secure_token
		self.secure_token = SecureRandom.urlsafe_base64
		self.secure_token_expire = DateTime.now + 1.hours
	end

	def remove_secure_token
		self.secure_token = nil
		self.secure_token_expire = nil
	end

	def deduct_credit(cost)
		self.credit = self.credit - cost
		self.save
	end

end
