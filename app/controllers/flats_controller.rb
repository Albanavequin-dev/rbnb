class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
    @flats = Flat.all
  end

  def show
    @flats = Flat.new
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
