class RailwayStation < ApplicationRecord
  validates :title, presence: true

  # станция имеет множество поездов
  has_many :trains

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
end