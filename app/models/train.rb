class Train < ApplicationRecord
  validates :number, presence: true

  # поезд связан с одной станцией
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  # поезд имеет один маршрут
  belongs_to :route
  # поезд содержит информацию о билетах
  has_many :tickets
end