class ReportsController < ApplicationController
  require 'csv'
  before_action :set_restaurant, only: %i[index new create]
  def index
    @reports = policy_scope(Report)
    new unless @restaurant.report
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
      name = "#{first_name} #{last_name}"
      row[:employee_name] = name
      @report.data << row.to_a
    end
    @report.save
    authorize @report
    redirect_to restaurant_reports_path(@restaurant)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    authorize @report
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def report_params
    params.require(:report).permit(:file)
  end
end
