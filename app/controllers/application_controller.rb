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
        @first_name = row[:employee_name].split(', ')[1]
        @last_name = row[:employee_name].split(', ')[0]
        @id = row[:employee_id]

        @start_time = row[:shift_start_time]
        @finish_time = row[:shift_end_time]

        @shift = Shift.new(break: false, start: @start_time, finish: @finish_time, missing: false)

        @shift.restaurant = @restaurant

        if Worker.find_by(number: @id).nil?
          @worker = Worker.new(first_name: @first_name, last_name: @last_name, number: @id)
          @worker.restaurant = @restaurant
          @worker.save
          @shift.worker = @worker
        else
          @worker = Worker.find_by(number: @id)
          @shift.worker = @worker
        end
        @shift.report = @report
        @shift.save
      end
    end
  end

  def worker_from_report

  end
end
