class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
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

def user_is_owner?
  # el record sobre el cual autorice
  # current_user = user
  # @restaurant => record
  user == record.user # de esta forma en caso de ser admin, me entrega true
end
