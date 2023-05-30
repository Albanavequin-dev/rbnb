class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def show
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
  private

  def policy_scope(record)
    Pundit.policy_scope!(current_user, record)
  end
end
