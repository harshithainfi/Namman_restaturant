class RestaurantsController < ApplicationController
  require 'csv'
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end

  def new
    @restaurant = Restaurant.new
  end

  def flip_restaurant_status
     @restaurant.delay(:run_at => 5.minutes.from_now).flip_status
     redirect_to root_path, status: :see_other
  end
 
   def destroy
    @restaurant = Restaurant.find(params[:id])
     flip_restaurant_status
  end

  def search_restaurants
    term = params[:search] || ""
    @restaurants = Restaurant.where("name LIKE :search", search: "%#{term}%")
    render "index"
  end

  def search_dishes
    @restaurant = Restaurant.find params[:restaurant_id]
    term = params[:search] || ""
    @dishes = Dish.where("name LIKE :search", search: "%#{term}%")
    render "show"
  end


  def download_dishes
    @restaurant = Restaurant.find(params[:id])
    response.headers['Content-Disposition'] = 'download; filename="search_dishes.csv"'
    response.headers['Content-Type'] = 'application/csv'
    response.stream.write %w(name).to_csv.chomp+"\r\n"
    @restaurant.dishes.each do |si|
      response.stream.write [si.name].to_csv.chomp+"\r\n"
    end
  ensure
    response.stream.close
  end

  def download_restaurants
    @restaurant = Restaurant.all
    response.headers['Content-Disposition'] = 'download; filename="search_dishes.csv"'
    response.headers['Content-Type'] = 'application/csv'
    response.stream.write %w(name).to_csv.chomp+"\r\n"
    @restaurant.each do |si|
      response.stream.write [si.name].to_csv.chomp+"\r\n"
    end
  ensure
    response.stream.close
  end

  def create
    @restaurant = Restaurant.new(name: params[:restaurant][:name])
   if @restaurant.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

end