class AddBigintToPhone < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :phone_num, :bigint
  end
end
