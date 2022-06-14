class ReviewsController < ApplicationController
  def create
    attrs = {review: params[:review][:review], rating: params[:rating].to_i}
    klass,owner_id = nil,nil
  if params[:restaurant_id].present?
    klass = Restaurant
    owner_id = params[:restaurant_id]
    else
    klass = Dish
    owner_id = params[:dish_id]
  end
    @owner = klass.find owner_id
    @owner.reviews.create(attrs)
  render "restaurants/#{owner_id}"
  end
end