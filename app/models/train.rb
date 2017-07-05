class Train < ApplicationRecord
  # поезд связан с одной станцией
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  # поезд принадлежит маршруту
  belongs_to :route, optional: true
  # поезд содержит информацию о билетах
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  scope :train_route_station, ->(station) { joins(route: :railway_stations).where('railway_station_id = ?', station)}
  
  def wagons_by_type(wagon_type)
    wagons.where(type: wagon_type)
  end

  def places_by_type(wagon_type, place_type)
    wagons.where(type: wagon_type).sum(place_type)
  end

end