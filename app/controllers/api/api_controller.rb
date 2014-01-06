class Api::ApiController < ActionController::Base
  before_filter :check_access_token
  include Api::SessionsHelper

  class NotFound < StandardError
  end
  
  rescue_from NotFound, :with => :notfound_error
 
  def get_entity entity
    raise NotFound unless entity.present?
    return entity
  end


  def render_errors status_code, errors, http_code = 400
  	render json: {status_code: status_code, errors: errors, status: "error", accessing_time: Time.now.to_i}, status: http_code
  end

  def notfound_error
    render_errors('501',['Entity not found.'])
  end

  def check_access_token
    @user = get_entity User.find_by_secure_token(params[:secure_token])
    if @user.check_session_expire
      render_errors('501',['Session expired'])
    else
      set_current_user(@user)
    end
      
  end
end
