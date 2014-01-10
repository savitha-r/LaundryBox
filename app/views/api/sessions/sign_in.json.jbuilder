# Any helpers available to views are available to the builder

json.user do
  json.email_address @user.email
  json.updated_at @user.updated_at
end
