class ShiftsController < ApplicationController
  def index
    @shifts = current_user.restaurant.report.shifts
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
    @shift.update({:start=>shift_params[:start], :finish=>shift_params[:finish]})
    authorize @shift
    @shift.save
    redirect_to restaurant_reports_path(@shift.restaurant)
  end

  def create
    @shift = Shift.new({:start=>shift_params[:start], :finish=>shift_params[:finish]})
    worker = set_worker(nil, params[:shift]["first_name"], params[:shift]["last_name"])
    @shift.worker = worker
    @restaurant = current_user.restaurant
    @shift.restaurant = @restaurant
    create_report if @shift.restaurant.report.nil?
    @shift.report = @shift.restaurant.report
    authorize @shift
    if @shift.save
      respond_to do |format|
        format.turbo_stream do
          turbo_stream.remove(:new_shift)
          render turbo_stream: turbo_stream.append(:shifts, partial: "shifts/shift", locals: { shift: @shift })
      end
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove(:new_shift)
      end
      format.html { redirect_to restaurant_reports_url(@restaurant) }

    end
    else
      render 'new'
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    authorize @shift
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@shift) }
      format.html         { redirect_to restaurant_reports_url(@restaurant) }
    end
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
