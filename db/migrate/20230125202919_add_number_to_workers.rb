class AddNumberToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :number, :integer
  end
end
