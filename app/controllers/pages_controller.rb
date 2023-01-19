class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    redirect_to dashboard_path if current_user.present?
  end

  def dashboard
    @restaurant = current_user.restaurant
  end
end
