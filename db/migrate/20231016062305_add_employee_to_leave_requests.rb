class AddEmployeeToLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :leave_requests, :employee, null: false, foreign_key: true
  end
end
