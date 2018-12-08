class CreateMoneyFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :money_flows do |t|
      t.integer :kind, null: false
      t.integer :amount, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
