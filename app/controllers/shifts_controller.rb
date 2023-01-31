class ShiftsController < ApplicationController
  def index
    @shifts = current_user.restaurant.report.shifts
    respond_to do |format|
      format.html
      format.js { render template: 'shifts/index' }
    end
  end

  def new
    @shift = Shift.new()
    authorize @shift
  end

  def edit
    @shift = Shift.find(params[:id])
    authorize @shift
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.update(shift_params)
    authorize @shift
    @shift.save
    redirect_to restaurant_reports_path(@shift.restaurant)
  end

  def create
    @shift = Shift.new({:start=>shift_params[:start], :finish=>shift_params[:finish]})
    worker = set_worker(nil, params[:shift]["first_name"], params[:shift]["last_name"])
    @shift.worker = worker
    @shift.restaurant = current_user.restaurant
    create_report if @shift.restaurant.report.nil?
    @shift.report = @shift.restaurant.report
    authorize @shift
    @shift.save
    if @shift.save
      redirect_to restaurant_reports_path(@shift.restaurant)
    else
      render 'new'
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    authorize @shift
    redirect_to restaurant_reports_path(current_user.restaurant)
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :first_name, :last_name) do |p|
      p[:start] = Time.parse(p[:start])
      p[:finish] = Time.parse(p[:finish])
    end
  end

  def create_report
    report = Report.new
    report.restaurant = current_user.restaurant
    report.save
  end
end
