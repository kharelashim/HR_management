class LeaveRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_request do |t|
      t.date :start_date
      t.date :end_date
      t.string :leave_type  
      t.string :status
    end
  end
end
