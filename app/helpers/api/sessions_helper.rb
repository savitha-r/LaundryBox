module Api::SessionsHelper

  def login(user)
    #user.update_token_expire
    self.current_user = user
  end

  def logout(user)
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
