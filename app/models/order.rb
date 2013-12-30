class Order < ActiveRecord::Base
belongs_to :user
has_many :items
validates_presence_of :cost, :status

after_save :check_status, :if => self.status_changed?
before_save :calculate_cost


STATUS = {
	  AWAITING_COLLECTION => "Awaiting Collection",
	  PENDING_PAYMENT => "Pending Payment",
	  PAID => "Payment Completed",
	  READY => "Order Ready"
  }

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
