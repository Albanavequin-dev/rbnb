class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flats = Flats.all
  end

  def new
    @flat = Flat.new
    authorize @flat #line must be at the end of the method WARNING
  end

  def create
    authorize @flat #line must be at the end of the method WARNING
  end

  def edit
    authorize @flat #line must be at the end of the method WARNING
  end

  def update
    authorize @flat #line must be at the end of the method WARNING
  end

  def destroy
    authorize @flat #line must be at the end of the method WARNING
  end
end
