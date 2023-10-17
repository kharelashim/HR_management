class AddDefaultValueToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :leave_requests, :status, :integer, :default => 0
  end
end
