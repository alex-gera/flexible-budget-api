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

class MoneyFlow < ApplicationRecord
  # === Relations
  belongs_to :day

  # === Enums
  enum kind: [:income, :expense]

  # === Validations
  validates :kind, presence: true
  validates :amount, presence: true
end
