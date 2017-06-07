class AddSortFieldsForWagonsInTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :wagons_sort, :boolean
  end
end
