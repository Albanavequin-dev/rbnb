class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.admin?
        scope.all  # Allow admin users to access all records
      else
        scope.where(user: user)  # Restrict access to records owned by the user
      end
    end
  end
end
