class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
