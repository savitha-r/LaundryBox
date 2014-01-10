class Api::V1::OrdersController < Api::ApiController
	before_filter :check_order_belongs_to_user, :except => [:create, :index]

	def create
		@order = current_user.orders.build(order_profile_parameters)
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
		@orders = current_user.orders
	end

	def payment
		@order = Order.find_by_id(params[:id])
		if current_user.credit > @order.cost
			current_user.transaction do
				current_user.deduct_credit(@order.cost)
				@order.completed_payment
			end
		end
		render "show"
	end

	def get_reciept
		@order = get_entity Order.find_by_id(params[:id])
		render "show"
	end





	private

	def check_order_belongs_to_user
		@order = get_entity Order.find_by_id(params[:id])
		unless @order.user_id == current_user.id || current_user.is_collector?
			render_errors('501',['This order does not belong to the current user.'])
		end
	end

	def order_profile_parameters
    	params.require(:order).permit(:cost, :status, :special_message, items_attributes: [:name])
  	end
end
