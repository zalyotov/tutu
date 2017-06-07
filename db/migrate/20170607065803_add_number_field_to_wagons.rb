class AddNumberFieldToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :number, :integer
  end
end
