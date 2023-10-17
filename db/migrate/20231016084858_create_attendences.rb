class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences do |t|
      t.time :check_in_time
      t.time :check_out_time
      t.date :date
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
