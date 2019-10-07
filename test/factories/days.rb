# == Schema Information
#
# Table name: days
#
#  id           :bigint(8)        not null, primary key
#  date         :date             not null
#  daily_budget :integer
#  balance      :integer
#  period_id    :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :day do
    date { '2018-09-14' }
    budget { 1 }
    balance { 1 }
  end
end
