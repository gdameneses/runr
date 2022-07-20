class FloorplanPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(restaurant_id: user.restaurant.id)
    end
  end
end
