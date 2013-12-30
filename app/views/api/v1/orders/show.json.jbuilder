# Any helpers available to views are available to the builder

json.order do
  json.id @order.id
  json.cost @order.cost
  json.status @order.status
  unless @order.special_message.empty?
  	json.message @order.special_message
  end
end

@order.items.each do |i|
	json.items do
		json.item i.name
		json.cost i.cost
	end
end

