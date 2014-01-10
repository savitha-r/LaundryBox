class Order < ActiveRecord::Base

belongs_to :user
has_many :items


validates_presence_of :cost, :status
validates_inclusion_of :status, :in => ["AWAITING_COLLECTION", "PENDING_PAYMENT", "PAID", "READY"]

#use constants
after_save :check_status
before_save :calculate_cost
before_create :set_default_status

AWAITING_COLLECTION = "AWAITING COLLECTION"
PENDING_PAYMENT = "PENDING PAYMENT"
PAID = "PAID"
READY = "READY"

def set_default_status
	self.status = AWAITING_COLLECTION
end


def check_status
	if status == PENDING_PAYMENT
		p 'send notification waiting payment'
		#send notification of payment amoune
	elsif status == READY
		p 'send notification ready'
		#send notification that laundry is ready
	end
end

def calculate_cost
	self.cost = 0.0
	self.items.each do |i|
		self.cost += i.category.cost
	end
end

def completed_payment
	self.status = PAID
	self.save
end


end
