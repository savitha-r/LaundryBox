class Api::Admin::OrdersController < Api::Admin::AdminController

	def create
		@user = User.find_by_id(params[:user_id])
		@order = @user.orders.build(order_profile_parameters)
		if @order.save
			render "show"
		else
			render_errors('5002',@order.errors)
		end
	end

	def update
		@order = get_entity Order.find_by_id(params[:id])
		if @order.update_attributes(order_profile_parameters)
			render "show"
		else
			render_errors('5002', @order.errors)
		end
	end

	def show
		@order = get_entity Order.find_by_id(params[:id])
	end

	def index
		@orders = get_entity Order.find_all_by_user_id(params[:user_id])
	end

	def get_reciept
		@order = get_entity Order.find_by_id(params[:id])
		render "show"
	end

	private
	def order_profile_parameters
    	params.require(:order).permit(:cost, :status, :special_message, items_attributes: [:name])
  	end
end
