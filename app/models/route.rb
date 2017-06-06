class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  #scope :sort, -> { order(:sort) }

  validates :title, presence: true
end
