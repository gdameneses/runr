class AddColumnsToReports < ActiveRecord::Migration[7.0]
  def change
    add_reference :reports, :worker, null: false, foreign_key: true
    add_column :reports, :break, :boolean
    add_column :reports, :start, :time
    add_column :reports, :finish, :time
    add_column :reports, :missing, :boolean
  end
end
