class Api::V1::UsersController < Api::ApiController
	before_filter :check_access_token, :except => [:create]
	before_filter :check_collector, :only => [:index]

	def create
		@user = User.build(user_profile_parameters)
		unless @user.save
			render_errors('501', @user.errors)
		end
		render "show"
	end

	def update
		unless current_user.update_attributes(user_profile_parameters)
			render_errors('501', @user.errors)
		end
		render "show"
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
    	params.require(:user).permit(:name, :email, :password_digest, :credit, :role)
  	end
end
