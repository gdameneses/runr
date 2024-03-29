class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

    def csv_to_shift(file)
    @report.file.blob.open do |file|
      CSV.foreach(file, headers: :first_row, header_converters: :symbol, col_sep: "\t", encoding: 'utf-16le:utf-8') do |row|
        first_name = row[:employee_name].split(', ')[1]
        last_name = row[:employee_name].split(', ')[0]
        id = row[:employee_id]
        date = row[:shift_start_date].split[0]
        start = Time.new("#{date} #{row[:shift_start_time]}")
        finish = Time.new("#{date} #{row[:shift_end_time]}")

        finish = finish + 86400 if start > finish

        @shift = Shift.new(break: false, start: start, finish: finish, missing: false)
        @shift.restaurant = @restaurant
        @shift.report = @report
        @shift.worker = set_worker(id, first_name, last_name)
        @shift.save
      end
    end
  end

  def set_worker_from_id(id)
    if Worker.find_by(number: id).nil?
      @worker = Worker.new(first_name: first_name, last_name: last_name, number: id)
      @worker.restaurant = @restaurant
      @worker.save
      @shift.worker = @worker
    else
      @worker = Worker.find_by(number: id)
      @shift.worker = @worker
    end
  end

  def set_worker(id = nil, first_name, last_name)
    worker = id ? Worker.find_by(number: id) : Worker.find_by("first_name ILIKE ? AND last_name ILIKE ?", first_name, last_name)
    if worker.nil?
      worker = Worker.new(first_name: first_name, last_name: last_name, number: id)
      worker.restaurant = current_user.restaurant
      worker.save
    end
    worker
  end
end
