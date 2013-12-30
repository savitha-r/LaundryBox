module Api::SessionsHelper

  def login(user)
    user.set_secure_token
    self.current_user = user
  end

  def logout(user)
  	current_user.remove_secure_token
    self.current_user = nil
  end

  def current_user=(member)
    @current_user = member
  end

  

end
