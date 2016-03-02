class CreateProductivities < ActiveRecord::Migration
  def change
    create_table :productivities do |t|
      t.date :analysis_start_date
      t.date :analysis_end_date
      t.integer :call_qty
      t.integer :answered_call_qty
      t.integer :interlocutor_qty
      t.integer :schedule_qty
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
