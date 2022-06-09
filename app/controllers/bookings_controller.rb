class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @trip = Trip.find(params[:trip_id])
    @booking.user = current_user
    @booking.trip = @trip
    @booking.status = "pending"
    if @booking.save
      redirect_to trip_booking_path(@trip, @booking)
    else
      render :new
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   if @booking.update(booking_params)
  #     redirect_to booking_path(@booking)
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :trip, :status, :passengers)
  end
end
