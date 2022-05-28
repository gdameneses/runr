class StationsController < ApplicationController
  before_action :get_restaurant
  def index
    @stations = policy_scope(Station)
  end

  def new
    @station = Station.new()
    authorize @station
  end

  def create
    @station = Station.new(station_params)
    @station.restaurant = @restaurant
    @station.save
    authorize @station
    redirect_to(restaurant_stations_path(@restaurant))
  end

  private

  def get_restaurant
    @restaurant = current_user.restaurant
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
