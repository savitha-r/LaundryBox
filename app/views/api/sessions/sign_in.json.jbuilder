# Any helpers available to views are available to the builder

json.user do
  json.email_address @user.email
  json.secure_token @user.secure_token
  json.token_expire @user.secure_token_expire
end
