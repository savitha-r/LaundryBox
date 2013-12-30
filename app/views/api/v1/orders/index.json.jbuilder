@orders.each do |o|

	json.order do
  		json.id o.id
  		json.cost o.cost
  		json.status o.status
  		json.items o.items.count
  	end
end
