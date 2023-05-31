class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    authorize @booking
  end

  def show
    authorize @booking #line must be at the end of the method WARNING
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking #line must be at the end of the method WARNING
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = Flat.find(params[:flat_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:booking).permit(:arrival_date, :departure_date, :message_customer, :message_owner)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
