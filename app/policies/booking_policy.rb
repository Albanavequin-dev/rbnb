class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    p user
    p record.user
    p record.flat.user
    record.user == user || record.flat.user == user
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user || record.flat.user == user
  end

  def update?
    record.user == user || record.flat.user == user
  end

  def destroy?
    record.user == user || record.flat.user == user
  end
end
