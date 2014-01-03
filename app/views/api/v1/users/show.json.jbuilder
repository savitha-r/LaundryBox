# Any helpers available to views are available to the builder

json.user do
  json.email_address @user.email
  json.secure_token @user.secure_token
  json.token_expire @user.secure_token_expire
end

@user.orders.each do |o|
	json.order do
		json.id o.id
		json.cost o.cost
		json.itsms o.items.count
	end
end

