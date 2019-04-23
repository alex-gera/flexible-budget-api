class MoneyFlow < ApplicationRecord
  # === Relations
  belongs_to :day

  # === Enums
  enum kind: %i[income expense]

  # === Validations
  validates :kind, presence: true
  validates :amount, presence: true
end
