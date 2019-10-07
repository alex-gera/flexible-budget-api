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

require 'test_helper'

class PeriodMoneyFlowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
