@users.each do |u|

	json.user do
  		json.name u.name
  		json.email_address u.email
  		json.secure_token u.secure_token
  		json.token_expire = u.expire_secure_token
  	end
end
