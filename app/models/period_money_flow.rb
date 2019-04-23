class PeriodMoneyFlow < ApplicationRecord
  # === Relations
  belongs_to :period

  # === Enums
  enum kind: %i[income expense]

  # === Validations
  validates :kind, presence: true
  validates :amount, presence: true
end
