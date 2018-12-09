class PeriodMoneyFlow < ApplicationRecord
  # === Relations
  belongs_to :period

  # === Enums
  enum kind: [:income, :expense]

  # === Validations
  validates :kind, presence: true
  validates :amount, presence: true
end
