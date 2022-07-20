class CreateFloorplans < ActiveRecord::Migration[6.1]
  def change
    create_table :floorplans do |t|
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
