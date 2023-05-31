class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking #line must be at the end of the method WARNING
  end

  def new
    @booking = Booking.new
    authorize @booking #line must be at the end of the method WARNING
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
    authorize @booking #line must be at the end of the method WARNING
  end

  def edit
    authorize @booking #line must be at the end of the method WARNING
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
    authorize @booking #line must be at the end of the method WARNING
  end

  def destroy
    @booking.destroy
    redirect_to booking_path, status: :see_other
    authorize @booking #line must be at the end of the method WARNING
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
