class Item < ActiveRecord::Base
	belongs_to :order
	has_one :category
	validates_presence_of :name
end
