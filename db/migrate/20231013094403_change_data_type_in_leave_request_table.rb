class ChangeDataTypeInLeaveRequestTable < ActiveRecord::Migration[7.0]
  def up
    execute "ALTER TABLE leave_requests ALTER COLUMN status TYPE integer USING status::integer"
  end

  def down
    execute "ALTER TABLE table_requests ALTER COLUMN status TYPE varchar USING status::varchar"
  end
end
