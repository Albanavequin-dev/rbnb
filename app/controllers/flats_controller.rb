class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def show
    authorize @flat #line must be at the end of the method WARNING
  end

  def new
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
