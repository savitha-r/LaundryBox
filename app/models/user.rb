class User < ActiveRecord::Base
	has_many :orders

	has_secure_password

	validates_presence_of :password_digest, :email, :role
	validates_uniqueness_of :email

	before_save :set_secure_token

	ROLES = ["customer", "collector", "admin"]
	CUSTOMER = "customer"
	COLLECTOR = "collector"
	ADMIN = "admin"

	def check_session_expire
		if DateTime.now > self.updated_at + 1.hours
			return true
		else
			return false
		end
	end

	def token
		Digest::SHA1.hexdigest (self.email + self.updated_at.to_s)
	end

	def deduct_credit(cost)
		self.credit = self.credit - cost
		self.save
	end

	def is_admin?
		self.role == ADMIN
	end

	def is_collector?
		self.role == COLLECTOR
	end


end
