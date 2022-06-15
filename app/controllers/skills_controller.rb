class SkillsController < ApplicationController
  before_action :get_restaurant
  before_action :get_worker

  def new
    @skill = Skill.new()
    authorize @skill
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.worker = @worker
    authorize @skill
    if @skill.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:level, :station_id)

  end
  def get_restaurant
    @restaurant = Worker.find(params[:worker_id]).restaurant
  end

  def get_worker
    @worker = Worker.find(params[:worker_id])
  end

end
