class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_reference  :leave_request, :employees, foreign_key: true
  end
end
