class Api::Admin::AdminController < ApplicationController
	before_filter :check_role

	def check_role
		unless current_user.is_collector? || current_user.is_admin?
			render_errors('5001',['Items cannot be modified by customers.'])
		end
	end
end
