class ReportsController < ApplicationController
  require 'csv'
  before_action :set_restaurant, only: %i[index new create destroy update]
  def index
    new unless @restaurant.report
    @reports = policy_scope(Report)
    @shift = Shift.new()
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
    redirect_to restaurant_reports_path(@restaurant)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    authorize @report
    redirect_to restaurant_reports_path(@restaurant)

  end

  def update
    @report = @restaurant.report
    @report.destroy
    create
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def report_params
    params.require(:report).permit(:file)
  end


end
