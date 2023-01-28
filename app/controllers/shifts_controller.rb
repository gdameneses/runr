class ShiftsController < ApplicationController
  def new
    @shift = Shift.new()
    authorize @shift
  end
  def create
    @shift = Shift.new(shift_params)
    worker = set_worker(nil, params[:shift]["first_name"], params[:shift]["last_name"])
    @shift.worker = worker
    @shift.restaurant = current_user.restaurant
    @shift.report = current_user.restaurant.report
    if @shift.save
      authorize @shift
      redirect_to restaurant_reports_path(@shift.restaurant)
    else
      render 'new'
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish) do |p|
      p[:start] = Time.parse(p[:start])
      p[:finish] = Time.parse(p[:finish])
    end
  end
end
