class Api::SessionsController < Api::ApiController
	before_filter :check_access_token, :except => [:sign_in]

	def sign_in
		@user = get_entity User.find_by_email(params[:email])
		if @user.authenticate(params[:password])
			login(@user)
		else
			render_errors
		end
	end

	def sign_out
		@user = get_entity User.find_by_secure_token(params[:secure_token])
		logout(@user)
	end
end
