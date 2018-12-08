class BudgetCalculator
  def self.calc
    @budget = Budget.last
    @budget.update(self.properties)
    self.daily_budget()
    @budget
  end
  
  private
  
  def self.daily_budget
    days_count = (@budget.finished_at - @budget.start_at).to_i
    average_daily_budget = @budget.income / days_count
    @income_money_flows.sort! { |a, b| a.expected_date <=> b.expected_date }
    periods = []

    @income_money_flows.each_with_index do |income, index|
      puts '======================================================'
      puts "PERIOD: income: #{income.amount}, date: #{income.expected_date}"
      prev_period = periods[index - 1]
      next_period = @income_money_flows[index + 1]
      next_date = next_period ? next_period.expected_date : @budget.finished_at
      period_days_count = (next_date - income.expected_date).to_i
      daily_budget = income.amount / period_days_count
      balance = prev_period ? prev_period[-1].balance + daily_budget : daily_budget
      period = []

      period_days_count.times do |i|
        day = Day.new(date: income.expected_date + i, daily_budget: daily_budget, balance: balance, budget_id: @budget.id)
        balance = balance + daily_budget
        period.push day
        puts "DAY: daily_budget: #{day.daily_budget}, balance: #{day.balance}"
      end

      periods.push period
    end
    # byebug
  end
  
  def self.properties
    self.entities()

    expected_expenditure = @expenditure_money_flows.select { |m| !m.actual_date }.sum { |m| m.amount }
    total_expenditure = @expenditure_money_flows.sum { |m| m.amount }
    total_income = @income_money_flows.sum { |m| m.amount }
    accumulation = total_income / 100 * @accumulator_money_flow.amount

    {
      income: total_income - expected_expenditure - accumulation,
      balance: total_income - total_expenditure - accumulation,
      accumulation: accumulation,
    }
  end

  def self.entities
    @income_money_flows = MoneyFlow.where(kind: 0).to_a
    @expenditure_money_flows = MoneyFlow.where(kind: 1).to_a
    @accumulator_money_flow = MoneyFlow.find_by(kind: 2)
  end
end