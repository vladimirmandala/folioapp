class CollectionsController < ApplicationController

	def index
		@user = User.find params[:user_id]
	end

	def show
		@user = User.find params[:user_id]
		@collection = @user.collections.find params[:id]
	end

	def new
		@user = User.find params[:user_id]
		@collection = @user.collections.new
	end

	def create
		@user = User.find params[:user_id]
		@collection = @user.collections.create collection_params
		render "index"
	end

	def update
		@collection = Collection.find params[:id]
		[:title, :description].each do |attr|
			if params[attr]
				@collection.update!(attr => params[attr])
			end
		end
		render json: {success: 200}

	end

	private

	def collection_params
		params.require(:collection).permit(:title, :description, :image)
	end

end
