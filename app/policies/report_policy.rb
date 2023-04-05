class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(restaurant_id: user.restaurant.id)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    create?
  end

  def destroy?
    true
  end
end
