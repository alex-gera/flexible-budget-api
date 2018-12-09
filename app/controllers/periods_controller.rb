class PeriodsController < ApplicationController
  def index
    render json: { periods: Period.calculate_all }, status: :ok
  end

  def create; end

  def update
    if Period.find(params[:id]).update(period_params)
      render json: {}, status: :ok
    end
  end

  private

  def period_params
    params.require(:period).permit(:accumulation)
  end
end
