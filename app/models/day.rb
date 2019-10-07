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

class Day < ApplicationRecord
  # === Relations
  has_many :money_flows, dependent: :destroy
  belongs_to :period

  # === Validations
  validates :date, presence: true
end
