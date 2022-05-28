class StationsController < ApplicationController
  def index
    @stations = policy_scope(Station)
    @restaurant = current_user.restaurant
  end

  def new
    @station = Station.new()
    authorize @station
  end
end
