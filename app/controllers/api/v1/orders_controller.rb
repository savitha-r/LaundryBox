class Api::V1::OrdersController < Api::ApiController
	before_filter :check_order_belongs_to_user, :except => [:create]

	def create
		@order = current_user.orders.build(order_profile_parameters)
		unless @order.save
			render_errors('501',@order.errors)
		end
		render "show"
	end

	def update
		@order = get_entity Order.find_by_id(params[:id])
		unless @order.update_attributes(user_profile_parameters)
			render_errors('501', @order.errors)
		end
		render "show"
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





	private

	def check_order_belongs_to_user
		@order = get_entity Order.find_by_id(params[:order_id])
		unless @order.user_id == current_user.id || current_user.role == "collector"
			render_errors('501',['This order does not belong to the current user.'])
		end
	end

	def order_profile_parameters
    	params.require(:order).permit(:cost, :status, :special_message, :item_ids)
  	end
end
