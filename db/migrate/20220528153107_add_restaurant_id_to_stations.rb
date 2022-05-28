class AddRestaurantIdToStations < ActiveRecord::Migration[6.1]
  def change
    add_reference :stations, :restaurant, null: false, foreign_key: true
  end
end
