class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, :null => false, :default => 0
    User.find_each do |user|
      if user.admin
        user.role = :admin
      else
        user.role = :registered
      end
      user.save!
    end
  end
end
