class Day < ApplicationRecord
  # === Relations
  has_many :money_flows, dependent: :destroy
  belongs_to :period

  # === Validations
  validates :date, presence: true
end
