class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
