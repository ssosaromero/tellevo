class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def accept_booking?
    record.trip.user = user
  end

  def reject_booking?
    record.trip.user = user
  end

  def my_bookings
    show?
  end
end

private

def user_is_owner_or_admin?
  # el record sobre el cual autorice
  # current_user = user
  # @restaurant => record
  user == record.user || user.admin # de esta forma en caso de ser admin, me entrega true
end
