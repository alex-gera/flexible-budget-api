class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.integer :daily_budget
      t.integer :balance
      t.references :period, index: true, foreign_key: true
      t.timestamps
    end
  end
end
