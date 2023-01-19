class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[destroy show]
  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def show
    if @restaurant
      @workers = @restaurant.workers
      authorize @restaurant
    else
      @restaurant = Restaurant.new()
      authorize @restaurant
      redirect_to '/dashboard'
    end

  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @restaurant.save
    authorize @restaurant
    redirect_to '/dashboard'
  end

  def destroy
    if @restaurant
    authorize @restaurant
    @restaurant.destroy
    authorize @restaurant
    end
    redirect_to '/dashboard'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def set_restaurant
    @restaurant = current_user.restaurant
  end
end
