class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.integer :daily_budget, null: false
      t.integer :balance, null: false

      t.timestamps
    end

    change_table :money_flows do |t|
      t.belongs_to :day, index: true
    end
  end
end
