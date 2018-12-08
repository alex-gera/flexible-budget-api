class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.date :since
      t.date :until
      t.timestamps
    end
  end
end
