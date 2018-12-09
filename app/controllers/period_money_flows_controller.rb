class PeriodMoneyFlowsController < ApplicationController
  def index; end

  def create
    if PeriodMoneyFlow.create(money_flow_params)
      render json: {}, status: :ok
    end
  end

  def update
    if PeriodMoneyFlow.find(params[:id]).update(money_flow_params)
      render json: {}, status: :ok
    end
  end

  def destroy
    if PeriodMoneyFlow.find(params[:id]).destroy
      render json: {}, status: :ok
    end
  end

  private

  def money_flow_params
    params.require(:moneyFlow).permit(:description, :amount, :kind, :period_id)
  end
end
