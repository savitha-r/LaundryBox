class Api::V1::UsersController < Api::ApiController
	before_filter :check_access_token, :except => [:create]
	before_filter :check_collector, :only => [:index]

	def create
		@user = User.new(user_profile_parameters)
		if @user.save
			render "show"
		else
			render_errors('501', @user.errors)
		end
	end

	def update
		if current_user.update_attributes(user_profile_parameters)
			render "show"
		else
			render_errors('501', @user.errors)
		end
	end

	def show
		@user = current_user
	end

	def index
		@user = User.all
	end

	private

	def check_collector
		unless current_user.role == "collector"
			render_errors('501',['You are not authorised for this action.'])
		end
	end


	def user_profile_parameters
    	params.require(:user).permit(:email, :password, :password_confirmation, :credit, :role)
  	end
end
