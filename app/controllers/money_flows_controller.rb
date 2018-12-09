class MoneyFlowsController < ApplicationController
  def index; end

  def create
    if MoneyFlow.create(money_flow_params)
      render json: {}, status: :ok
    end
  end

  def update
    if MoneyFlow.find(params[:id]).update(money_flow_params)
      render json: {}, status: :ok
    end
  end

  def destroy
    if MoneyFlow.find(params[:id]).destroy
      render json: {}, status: :ok
    end
  end

  private

  def money_flow_params
    params.require(:moneyFlow).permit(:description, :amount, :kind, :day_id)
  end
end
