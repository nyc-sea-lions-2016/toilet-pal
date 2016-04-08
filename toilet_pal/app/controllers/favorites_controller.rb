class FavoritesController < ApplicationController

	def new
		@favorite = Favorite.new(
			toilet_id: params[:id],
			favoriter_id: session[:user_id]
			)
		if @favorite.save
			
		else

		end
	end
end
