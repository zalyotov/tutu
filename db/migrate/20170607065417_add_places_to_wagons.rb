class AddPlacesToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :places, :integer
    add_column :wagons, :seat_places, :integer
    add_column :wagons, :side_up_places, :integer
    add_column :wagons, :side_down_places, :integer
  end
end
