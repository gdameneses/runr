class FixValidationToShifts < ActiveRecord::Migration[7.0]
  def change
    change_column :shifts, :start, :datetime, null: :false
    change_column :shifts, :finish, :datetime, null: :false
  end
end
