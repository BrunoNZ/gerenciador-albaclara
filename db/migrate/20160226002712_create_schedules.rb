class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :time
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
