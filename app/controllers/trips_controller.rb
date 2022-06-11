class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def show
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip

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
    if @trip.destroy
      redirect_to trips_url, notice: 'trip was successfully destroyed.'
    else
      render :root
    end
  end

  def my_trips
    @trips = policy_scope(Trip).where(user: current_user)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:starting_point, :end_point, :departure_time, :number_of_passengers)
  end
end
