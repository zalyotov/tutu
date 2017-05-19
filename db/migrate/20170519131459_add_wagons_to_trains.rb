class AddWagonsToTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :up_places
      t.integer :down_places
      t.string :wagon_type
      t.belongs_to :train

      t.timestamps
    end

  end
end
