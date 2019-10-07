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

require 'test_helper'

class DayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
