class AddReportToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :report, null: false, foreign_key: true
  end
end
