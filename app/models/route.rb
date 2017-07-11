class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true
  validate :station_count

  before_validation :set_name

  private

  def station_count
    if railway_stations.size < 2
      errors.add(:base, "В маршруте должно быть минимум 2 станции")
    end
  end

  def set_name
    if railway_stations.first && railway_stations.last
      self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end
end
