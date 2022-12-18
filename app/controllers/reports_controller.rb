class ReportsController < ApplicationController
  def index
    @reports = policy_scope(Report)
    @restaurant = current_user.restaurant
    if !@restaurant.report
      @report = Report.new
      @report.restaurant = @restaurant
    end
  end
end
