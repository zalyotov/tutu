class ChangeArrivalAndDepartureTimeFieldType < ActiveRecord::Migration[5.1]
  def change
    change_column :railway_stations_routes, :arrival_time, :string
    change_column :railway_stations_routes, :departure_time, :string
  end
end
