class WorkersController < ApplicationController
  before_action :get_restaurant
  def index
    @workers = policy_scope(Worker)
  end

  def new
    @worker = Worker.new()
    authorize @worker
  end

  def show
    @worker = Worker.find(params[:id])
    authorize @worker
  end

  def edit
    @worker = Worker.find(params[:id])
    authorize @worker
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.restaurant = current_user.restaurant
    @worker.save
    authorize @worker
    redirect_to restaurant_workers_path(@restaurant)
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(worker_params)
    @worker.save
    authorize @worker
    redirect_to restaurant_workers_path(@restaurant)
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    authorize @worker
    redirect_to restaurant_workers_path(@restaurant)

  end

  private

  def get_restaurant
    @restaurant = current_user.restaurant
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :number)
  end
end
