class Api::Admin::CategoriesController < Api::Admin::AdminController
	def create
		@category = Category.new(category_parameters)
		if @category.save
			render "show"
		else
			render_errors('5002',@category.errors)
		end
	end

	def update
		@category = get_entity Category.find_by_id(params[:id])
		if @category.update_attributes(category_parameters)
			render "show"
		else
			render_errors('5002', @category.errors)
		end
	end

	def show
		@category = get_entity Category.find_by_id(params[:id])
	end

	def index
		@categories = Category.all
	end

	private

	def category_parameters
    	params.require(:category).permit(:name, :cost)
  	end
end
