class AddArrivalAndDepartureTimeToStationInTheRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_time, :arrival_time
    add_column :railway_stations_routes, :departure_time, :arrival_time
  end
end
