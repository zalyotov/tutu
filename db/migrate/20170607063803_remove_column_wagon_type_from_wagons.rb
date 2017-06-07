class RemoveColumnWagonTypeFromWagons < ActiveRecord::Migration[5.1]
  def change
    remove_column :wagons, :wagon_type
  end
end
