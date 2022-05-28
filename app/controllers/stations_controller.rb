class StationsController < ApplicationController
  before_action :get_restaurant
  def index
    @stations = policy_scope(Station)
  end

  def new
    @station = Station.new()
    authorize @station
  end

  private

  def get_restaurant
    @restaurant = current_user.restaurant
  end
end
