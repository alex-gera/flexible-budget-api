class Period < ApplicationRecord
  after_create :create_days

  has_many :period_money_flows
  has_many :days, -> { order(date: :asc) }

  def create_days
    range = (since .. self.until)

    range.each do |date|
      Day.create(date: date.to_s, period_id: id)
    end
  end

  def calculate_period_money_flows(kind, leftover)
    money_flows = period_money_flows.where(kind: kind)
    items = money_flows.map do |period_money_flow|
      {
        id: period_money_flow.id,
        description: period_money_flow.description,
        amount: period_money_flow.amount,
        kind: period_money_flow.kind,
      }
    end

    {
      items: items,
      total: items.map { |i| i[:amount] }.sum
    }
  end

  def calculate_period_days(period, daily_budget)
    items = period.days.each_with_index.map do |day, index|
      budget = index == 0 ? daily_budget : daily_budget + period.days[index - 1].balance
      expense = day.money_flows.map { |m| m[:amount] || 0 }.sum
      day.update(daily_budget: budget, balance: budget - expense)

      {
        id: day.id,
        date: day.date,
        dailyBudget: day.daily_budget,
        balance: day.balance,
        expense: expense,
        moneyFlows: day.money_flows,
      }
    end

    {
      items: items,
      total: items.map { |i| i[:expense] }.sum
    }
  end

  def self.calculate_all
    Period.all.order(since: :desc).map do |period|
      income_money_flows = period.calculate_period_money_flows(0)
      expense_money_flows = period.calculate_period_money_flows(1)
      income = income_money_flows[:total] - expense_money_flows[:total]
      daily_budget = income/period.days.size
      days = period.calculate_period_days(period, daily_budget)

      {
        id: period.id,
        since: period.since,
        until: period.until,
        incomeMoneyFlows: income_money_flows,
        expenseMoneyFlows: expense_money_flows,
        days: days,
        income: income,
        dailyBudget: daily_budget,
        accumulation: 0,
        balance: income - days[:total]
      }
    end
  end
end
