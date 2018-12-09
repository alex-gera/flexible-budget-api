class AddAccumulationToPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :periods, :accumulation, :integer
  end
end
