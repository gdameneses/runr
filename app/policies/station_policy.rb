class StationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.where(restaurant_id: user.restaurant.id)
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
