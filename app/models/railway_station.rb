class RailwayStation < ApplicationRecord
  # станция имеет множество поездов
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sort_field, -> { joins(:railway_stations_routes).order("railway_stations_routes.sort").distinct }
end