class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :owner
      t.string :phone
      t.string :address
      t.string :email_address

      t.timestamps null: false
    end
  end
end
