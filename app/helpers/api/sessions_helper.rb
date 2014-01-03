module Api::SessionsHelper

  def login(user)
    #user.update_token_expire
    user.set_secure_token
    user.save
    self.current_user = user
  end

  def logout(user)
  	current_user.remove_secure_token
    self.current_user = nil
  end

  def set_current_user(member)
    self.current_user = member
  end

  def current_user=(member)
    p 'set current artist'
    @current_user = member
  end

  def current_user
    @current_user
  end

  

end
