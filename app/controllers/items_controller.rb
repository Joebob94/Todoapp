class ItemsController < ApplicationController
	def index
		@items = Item.all.order("created_at DESC")
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to items_path
		else
			render "new"
		end

	end

	def show
		@item = Item.find(params[:id])
	end

	def destroy
		@item = Item.find(params[:id])
	end

	private def item_params
		params.require(:item).permit(:title, :description)
	end

end
