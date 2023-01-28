class ShiftsController < ApplicationController
  def new
    @shift = Shift.new()
    authorize @shift
  end

  def create
    @shift = Shift.new
    worker = set_worker(nil, params[:shift]["first_name"], params[:shift]["last_name"])
    start = params[:shift][:start]
    finish = params[:shift][:finish]
    now = Time.now()
    @shift.start = Time.new(now.year, now.month, now.day, start)
    @shift.finish = Time.new(now.year, now.month, now.day, finish)
    @shift.worker = worker
    @shift.restaurant = current_user.restaurant
    @shift.report = current_user.restaurant.report
    @shift.save
    authorize @shift
  end
end
