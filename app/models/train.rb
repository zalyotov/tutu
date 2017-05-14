class Train < ApplicationRecord
  # поезд связан с одной станцией
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  # поезд принадлежит маршруту
  belongs_to :route
  # поезд содержит информацию о билетах
  has_many :tickets

  validates :number, presence: true
end