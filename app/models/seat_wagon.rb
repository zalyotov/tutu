class SeatWagon < Wagon
  validates :seat_places, presence: true
end