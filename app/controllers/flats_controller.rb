class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flats = Flats.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
