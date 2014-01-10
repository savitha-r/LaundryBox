class Api::Admin::ItemsController < Api::Admin::AdminController

	def show
		@item = get_entity Item.find_by_id(params[:id])
	end

	def index
		@items = Item.all
	end

end
