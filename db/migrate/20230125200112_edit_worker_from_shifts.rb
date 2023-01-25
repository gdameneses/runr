class EditWorkerFromShifts < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :worker_id
  end
end
