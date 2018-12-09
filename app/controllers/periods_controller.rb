class PeriodsController < ApplicationController
  def index
    render json: { periods: Period.calculate_all }, status: :ok
  end

  def create
    
  end
end
