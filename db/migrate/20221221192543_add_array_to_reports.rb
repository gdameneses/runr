class AddArrayToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :data, :text, array: true, default: []
  end
end
