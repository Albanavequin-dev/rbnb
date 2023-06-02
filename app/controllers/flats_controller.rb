class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @flats = Flat.all
    @flats = policy_scope(Flat)
      if params[:address].present?
        @address = params[:address]
        @latitude, @longitude = Geocoder.coordinates(@address)
        @flats = Flat.near([@latitude, @longitude], 35)
      else
        @flats = Flat.all
      end
  end


  def show
    authorize @flat
    if @flat.user == current_user
      @my_flat = @flat
    end
    # @markers = @flat.geocoded.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end
  end

  def new
    @flat = Flat.new
    authorize @flat #line must be at the end of the method WARNING

  end

  def create
    @flat = Flat.new(flat_params)
    @flat.image.attach(params[:flat][:image])
    @flat.user = current_user

  if @flat.save && @flat.image.present?
    redirect_to flat_path(@flat), notice: 'Flat was successfully created.'
  else
    flash.now[:alert] = 'Please upload an image.'
    render :new, status: :unprocessable_entity
  end
     authorize @flat #line must be at the end of the method WARNING
  end

  def edit
    authorize @flat #line must be at the end of the method WARNING
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
    authorize @flat #line must be at the end of the method WARNING
  end

  def destroy
    @flat.destroy
    redirect_to restaurant_path, status: :see_other
    authorize @flat #line must be at the end of the method WARNING
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :wifi, :TV, :parking, :air_conditioner, :image)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
