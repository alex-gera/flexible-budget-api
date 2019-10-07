# == Schema Information
#
# Table name: money_flows
#
#  id          :bigint(8)        not null, primary key
#  kind        :integer          not null
#  amount      :integer          not null
#  description :string           not null
#  day_id      :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :income, class: MoneyFlow do
    kind { 0 }
    category { 'salary' }
    amount { Faker::Number.between(5000, 10_000) }
    expected_date { Faker::Date.forward(30) }
    repeating { true }
  end

  factory :expenditure, class: MoneyFlow do
    kind { 1 }
    category { Faker::Commerce.product_name }
    amount { Faker::Number.between(3000, 7000) }
    expected_date { Faker::Date.forward(30) }
    repeating { true }
  end
end
