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


	def edit
		@item = Item.find(params[:id])
	end


	def update 
		@item = Item.find(params[:id])

		if @item.update(item_params)
			redirect_to root_path
		else
			render 'edit'
		end

	end

	def destroy
		@item = Item.find(params[:id])

		@item.destroy
		redirect_to root_path
	end

	def complete
		@item = Item.find(params[:id])
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	def reverse
		@item = Item.find(params[:id])
		@item.update_attribute(:completed_at, nil)
		redirect_to root_path
	end


	private def item_params
		params.require(:item).permit(:title, :description)
	end

end
