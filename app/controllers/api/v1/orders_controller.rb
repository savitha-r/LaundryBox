class Api::V1::OrdersController < Api::ApiController
	before_filter :check_order_belongs_to_user, :except => [:create, :index]

	def create
		@order = current_user.orders.build(order_profile_parameters)
		if @order.save
			if @order.update_attributes(order_child_parameters)
				render "show"
			else
				render_errors('501', @order.errors)
			end
		else
			render_errors('501',@order.errors)
		end
	end

	def update
		@order = get_entity Order.find_by_id(params[:id])
		if @order.update_attributes(order_profile_parameters)
			render "show"
		else
			render_errors('501', @order.errors)
		end
	end

	def show
		@order = get_entity Order.find_by_id(params[:id])
	end

	def index
		@orders = get_entity Order.find_all_by_user_id(current_user.id)
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
		@order = get_entity Order.find_by_id(params[:order_id])
		render "show"
	end





	private

	def check_order_belongs_to_user
		if params[:id].nil?
			@order = get_entity Order.find_by_id(params[:order_id])
		else
			@order = get_entity Order.find_by_id(params[:id])
		end
		unless @order.user_id == current_user.id || current_user.role == "collector"
			render_errors('501',['This order does not belong to the current user.'])
		end
	end

	def order_child_parameters
    	params.require(:order).permit(:item_ids => [])
  	end	

	def order_profile_parameters
    	params.require(:order).permit(:cost, :status, :special_message)
  	end
end
