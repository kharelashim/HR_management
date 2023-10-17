class ChangeLeaveRequestToLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    rename_table :leave_request, :leave_requests
  end
end
