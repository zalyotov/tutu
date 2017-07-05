class RailwayStation < ApplicationRecord
  # станция имеет множество поездов
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sort_field, -> { joins(:railway_stations_routes).order("railway_stations_routes.sort").distinct }
  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_time_in(route)
    arrival_time = station_route(route).try(:arrival_time)
    arrival_time.strftime('%H:%M') unless arrival_time.nil?
  end

  def departure_time_in(route)
    departure_time = station_route(route).try(:departure_time)
    departure_time.strftime('%H:%M') unless departure_time.nil?
  end

  def update_time(route,  time)
    station_route = station_route(route)
    station_route.update(time) if station_route
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end