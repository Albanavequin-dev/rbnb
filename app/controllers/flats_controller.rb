class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]


  def index
    @flats = Flat.all
    @flats = policy_scope(Flat)
  end

  def show
    authorize @flat
  end

  def new
    @flat = Flat.new
    @flat.image.attach(nil)
    authorize @flat #line must be at the end of the method WARNING
  end

  def create
    @flat = Flat.new(flat_params)
  @flat.image.attach(params[:flat][:image])
  authorize @flat

  if @flat.save
    redirect_to flat_path(@flat), notice: 'Flat was successfully created.'
  else
    render :new
  end
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
    params.require(:flat).permit(:address, :description, :wifi, :TV, :parking, :air_conditioner, :image)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
