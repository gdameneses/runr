class FloorplansController < ApplicationController
  def index
    @floorplans = policy_scope(Floorplan)
  end
end
