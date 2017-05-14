class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.1]
  def change
    # add_column :trains, :railway_station_id, :integer

    # поезда принадлежат станциям
    add_belongs_to :trains, :current_station
  end
end