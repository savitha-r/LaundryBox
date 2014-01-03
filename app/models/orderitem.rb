class Orderitem < ActiveRecord::Base
	belongs_to :item
	belongs_to :order
	validates_presence_of :order_id, :item_id
end
