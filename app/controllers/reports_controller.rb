class ReportsController < ApplicationController
  require 'csv'
  before_action :set_restaurant, only: %i[index new create destroy update]
  def index
    new unless @restaurant.report
    @reports = policy_scope(Report)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.restaurant = @restaurant
    file = report_params[:file].tempfile
    CSV.foreach(file, headers: :first_row, header_converters: :symbol, col_sep: "\t", encoding: 'utf-16le:utf-8') do |row|
      first_name = row[:employee_name].split(', ')[1]
      last_name = row[:employee_name].split(', ')[0]
      id = row[:employee_id]
      s = Shift.new()
      s.worker = Worker.find_by(number: id)
      s.break = false
      s.start = row[:shift_start_time]
      s.finish = row[:shift_end_time]
      s.missing = false
      s.restaurant = @restaurant
      s.report = @report
      s.save
    end
    @report.save
    authorize @report
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
    @repor
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
