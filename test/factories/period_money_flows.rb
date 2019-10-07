# == Schema Information
#
# Table name: period_money_flows
#
#  id          :bigint(8)        not null, primary key
#  kind        :integer          not null
#  amount      :integer          not null
#  description :string           not null
#  period_id   :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :period_money_flow do
  end
end
