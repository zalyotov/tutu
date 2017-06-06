class CoupeWagon < Wagon
  validates :up_places, :down_places, presence: true
end