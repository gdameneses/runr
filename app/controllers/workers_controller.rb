class WorkersController < ApplicationController

  def new
    @worker = Worker.new()
    @restaurant = current_user.restaurant
    authorize @worker
  end

  def edit
    @worker = Worker.find(params[:id])
    @restaurant = @worker.restaurant
    authorize @worker
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.restaurant = current_user.restaurant
    @worker.save
    authorize @worker
    redirect_to restaurant_path(current_user.restaurant)
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name)
  end
end
