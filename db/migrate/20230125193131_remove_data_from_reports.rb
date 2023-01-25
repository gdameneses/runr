class RemoveDataFromReports < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :data
  end
end
