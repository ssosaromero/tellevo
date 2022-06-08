class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      redirect_to @trip, notice: 'trip was successfully created.'
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'trip was successfully destroyed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:starting_point, :end_point, :departure_time, :number_of_passengers)
  end
end
