class Period < ApplicationRecord
  has_many :period_money_flows
  has_many :days, -> { order(date: :asc) }

  after_create :create_days

  def create_days
    range = (since .. self.until)

    range.each do |date|
      Day.create(date: date)
    end
  end

  def calculate_period_money_flows(leftover)
    period_money_flows.map do |period_money_flow|
      {
        id: period_money_flow.id,
        description: period_money_flow.description,
        amount: period_money_flow.amount,
      }
    end
  end

  def self.calculate_all
    result = { }
    leftover = 0

    Period.all.order(since: :desc).map do |period|
      period_money_flows = period.calculate_period_money_flows(leftover)
      {
        id: period.id,
        since: period.since,
        until: period.until,
        period_money_flows: period_money_flows,
      }
    end
  end
end
