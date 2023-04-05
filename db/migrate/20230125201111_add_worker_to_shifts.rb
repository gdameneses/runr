class AddWorkerToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :worker, null: true, foreign_key: true
  end
end
