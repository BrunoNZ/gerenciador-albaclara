class AddConfirmationStatusToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :confirmation_status, :integer
  end
end
