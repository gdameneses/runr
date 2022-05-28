class StationsController < ApplicationController
  def index
    @stations = policy_scope(Station)
  end
end
