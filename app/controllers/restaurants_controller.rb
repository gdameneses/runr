class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
    # authorize @restaurant
  end
end
