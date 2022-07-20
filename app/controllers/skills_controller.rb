class SkillsController < ApplicationController
  before_action :get_restaurant
  # before_action :get_worker

  def new
    @skill = Skill.new()
    @worker = get_worker
    authorize @skill
  end

  def create
    @worker = get_worker
    @skill = Skill.new(skill_params)
    @skill.worker = @worker
    authorize @skill
    if @skill.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    authorize @skill
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    @worker = @skill.worker
    @skill.save
    authorize @skill
    redirect_to worker_path(@worker)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @worker = @skill.worker
    @skill.destroy
    authorize @skill
    redirect_to worker_path(@worker)
  end

  private

  def skill_params
    params.require(:skill).permit(:level, :station_id)

  end
  def get_restaurant
    @restaurant = current_user.restaurant
  end

  def get_worker
    @worker = Worker.find(params[:worker_id])
  end

end
