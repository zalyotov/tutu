class Ticket < ApplicationRecord
  validates :number, presence: true

  # билет принадлежит пользователю, в котором указан номер поезда
  belongs_to :train
  belongs_to :user

  # в билете указан пункт отправления и пункт назначения
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

end
