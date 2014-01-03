# Any helpers available to views are available to the builder

json.order do
  json.id @order.id
  json.cost @order.cost
  json.status @order.status
  if @order.special_message && !@order.special_message.empty?
  	json.message @order.special_message
  end
end

json.items @order.items do |json, item|
  json.(item , :id, :name, :cost)
end


