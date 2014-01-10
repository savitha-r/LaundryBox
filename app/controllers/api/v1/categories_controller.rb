class Api::V1::CategoriesController < ApplicationController
	
	def show
		@category = get_entity Category.find_by_id(params[:id])
	end

	def index
		@categories = Category.all
	end
end
