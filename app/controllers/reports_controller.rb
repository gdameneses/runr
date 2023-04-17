class ReportsController < ApplicationController
  before_action :set_restaurant, only: %i[index new show create destroy update]
  def index
    new unless @restaurant.report
    @reports = policy_scope(Report)
    @shift = Shift.new()
    @shifts = @restaurant.report.shifts if @restaurant.report
  end

  def show
    if @restaurant.report
      @report = @restaurant.report
    else
      new
    end
    authorize @report
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.restaurant = @restaurant
    @report.save
    authorize @report
    csv_to_shift(@report.file)
    redirect_back(fallback_location: root_path)

  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    authorize @report
    redirect_to restaurant_report_path(@restaurant)

  end

  def update
    @report = @restaurant.report
    @report.destroy
    create
  end

  def sort

  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def report_params
    params.require(:report).permit(:file)
  end


end
