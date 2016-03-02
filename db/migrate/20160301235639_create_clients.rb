class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.date :billing_date
      t.date :contract_start_date
      t.string :address

      t.timestamps null: false
    end
  end
end
