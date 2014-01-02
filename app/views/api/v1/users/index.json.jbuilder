@users.each do |u|

	json.user do
  		json.email_address u.email
  		json.secure_token u.secure_token
  		json.token_expire = u.secure_token_expire
  	end
end
