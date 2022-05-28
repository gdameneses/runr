class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def show
    @restaurant = current_user.restaurant
    @workers = @restaurant.workers
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @restaurant.save
    authorize @restaurant
    redirect_to '/dashboard'
  end

  def layout
    @restaurant = current_user.restaurant
    authorize @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
