class EconomWagon < Wagon
  validates :up_places, :down_places, :side_up_places, :side_down_places, presence: true
end