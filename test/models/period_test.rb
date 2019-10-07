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

require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
