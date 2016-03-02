class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_phone
      t.date :contact_date
      t.datetime :visit_datetime
      t.string :address
      t.text :observation
      t.integer :status
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
