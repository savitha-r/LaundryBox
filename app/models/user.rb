class User < ActiveRecord::Base
	has_many :orders

	has_secure_password

	validates_presence_of :name, :password_digest, :email, :role
	validates_uniqueness_of :email

	ROLES = ["customer", "collector", "admin"]

	def check_session_expire
		if !self.expire_secure_token.nil && DateTime.now > self.expire_secure_token
			return true
		else
			return false
		end
	end

	def set_secure_token
		self.secure_token = SecureRandom.urlsafe_base64
		self.expire_secure_token = DateTime.now + 1.hours
		self.save
	end

	def remove_secure_token
		self.secure_token = nil
		self.expire_secure_token = nil
	end

	def deduct_credit(cost)
		self.credit = self.credit - cost
		self.save
	end

end
