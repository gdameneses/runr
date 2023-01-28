class ChangeStartandFinishTypeOnShifts < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :start
    remove_column :shifts, :finish
    add_column :shifts, :start, :datetime
    add_column :shifts, :finish, :datetime
  end
end
