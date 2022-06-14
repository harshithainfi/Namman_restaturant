class DishesController < ApplicationController
	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.dishes.create(dishes_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
    def dishes_params
      params.require(:dish).permit(:name)
    end
end
