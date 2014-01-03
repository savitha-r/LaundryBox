class Item < ActiveRecord::Base
	has_many :orderitems
	has_many :orders, :through => :orderitems
	validates_presence_of :name, :cost
end
