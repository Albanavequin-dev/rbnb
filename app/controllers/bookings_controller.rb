class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking #line must be at the end of the method WARNING
  end

  def new
    authorize @booking #line must be at the end of the method WARNING
  end

  def create
    authorize @booking #line must be at the end of the method WARNING
  end

  def edit
    authorize @booking #line must be at the end of the method WARNING
  end

  def update
    authorize @booking #line must be at the end of the method WARNING
  end

  def destroy
    authorize @booking #line must be at the end of the method WARNING
  end
end
