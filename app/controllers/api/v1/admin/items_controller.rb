class Api::V1::Admin::ItemsController < Api::ApiController
	before_filter :check_role, :except => [:show, :index]
	
	def create
		@item = Item.new(item_parameters)
		if @item.save
			render "show"
		else
			render_errors('501',@item.errors)
		end
	end

	def update
		@item = get_entity Item.find_by_id(params[:id])
		if @item.update_attributes(item_parameters)
			render "show"
		else
			render_errors('501', @item.errors)
		end
	end

	def show
		@item = get_entity Item.find_by_id(params[:id])
	end

	def index
		@items = Item.all
	end

	private

	def check_role
		unless current_user.role == 'collector' || current_user.role == 'admin'
			render_errors('501',['Items cannot be modified by customers.'])
		end
	end

	private

	def item_parameters
    	params.require(:item).permit(:name, :cost)
  	end
end
