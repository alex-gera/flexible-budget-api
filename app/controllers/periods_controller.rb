class PeriodsController < ApplicationController
  def index
    render json: { periods: Period.calculate_all }, status: :ok
  end

  def create
    dates_arr = params[:periods]
    dates_arr.each_with_index do |start_date, index|
      end_date = dates_arr[index + 1]
      end_date = end_date ? end_date.to_date : dates_arr[0].to_date + 1.month
      p = Period.create(since: start_date, until: end_date)
    end

    render json: {}, status: :ok
  end

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
