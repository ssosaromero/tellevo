class TripPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def my_trips?
    show?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    # el record sobre el cual autorice
    # current_user = user
    # @restaurant => record
    user == record.user # de esta forma en caso de ser admin, me entrega true
  end











end
