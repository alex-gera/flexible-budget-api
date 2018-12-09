class CreatePeriodMoneyFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :period_money_flows do |t|
      t.integer :kind, null: false
      t.integer :amount, null: false
      t.string :description, null: false
      t.references :period, index: true, foreign_key: true
      t.timestamps
    end
  end
end
