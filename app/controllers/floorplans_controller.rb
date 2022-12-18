class FloorplansController < ApplicationController
  def index
    @floorplans = policy_scope(Floorplan)
  end

  def show
    @floorplan = Floorplan.find(params[:id])
    @stations = @floorplan.restaurant.stations
    authorize @floorplan
  end

  def create
    @floorplan = Floorplan.new
    @floorplan.restaurant = current_user.restaurant
    @floorplan.save
    authorize @floorplan
    redirect_to restaurant_floorplans_path(@floorplan.restaurant)
  end

  def destroy
    @floorplan = Floorplan.find(params[:id])
    @floorplan.destroy
    authorize @floorplan
    redirect_to restaurant_floorplans_path(@floorplan.restaurant)
  end
end
