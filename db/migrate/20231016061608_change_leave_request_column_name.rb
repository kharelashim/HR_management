class ChangeLeaveRequestColumnName < ActiveRecord::Migration[7.0]
  def change
    remove_column :leave_requests, :employees_id
  end
end
