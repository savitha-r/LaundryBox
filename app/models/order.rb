class Order < ActiveRecord::Base

belongs_to :user
has_many :items

validates_presence_of :cost, :status
validates_inclusion_of :status, :in => ["AWAITING_COLLECTION", "PENDING_PAYMENT", "PAID", "READY"]

after_save :check_status
before_save :calculate_cost
before_create :set_default_status

def set_default_status
	self.status = "AWAITING_COLLECTION"
end


def check_status
	if status == PENDING_PAYMENT
		#send notification of payment amoune
	elsif status == READY
		#send notification that laundry is ready
	end
end

def calculate_cost
	self.items.each do |i|
		self.cost += i.cost
	end
end

def completed_payment
	self.status = STATUS['PAID']
	self.save
end


end
