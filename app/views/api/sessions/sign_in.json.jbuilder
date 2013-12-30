# Any helpers available to views are available to the builder

json.user do
  json.name @@user.name
  json.email_address @user.email
  json.secure_token @user.secure_token
  json.token_expire = @user.expire_secure_token
end
