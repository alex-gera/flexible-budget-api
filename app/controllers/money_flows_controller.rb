class MoneyFlowsController < ApplicationController
  def index; end

  def create
    render json: {}, status: :ok if MoneyFlow.create(money_flow_params)
  end

  def update
    if MoneyFlow.find(params[:id]).update(money_flow_params)
      render json: {}, status: :ok
    end
  end

  def destroy
    render json: {}, status: :ok if MoneyFlow.find(params[:id]).destroy
  end

  private

  def money_flow_params
    params.require(:moneyFlow).permit(:description, :amount, :kind, :day_id)
  end
end
