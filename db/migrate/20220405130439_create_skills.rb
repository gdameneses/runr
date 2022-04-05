class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
