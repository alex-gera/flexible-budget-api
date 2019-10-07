# == Schema Information
#
# Table name: periods
#
#  id           :bigint(8)        not null, primary key
#  since        :date
#  until        :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  accumulation :integer
#

FactoryBot.define do
  factory :period do
  end
end
