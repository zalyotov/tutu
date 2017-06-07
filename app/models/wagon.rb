class Wagon < ApplicationRecord
  TYPE = { SeatWagon: 'Сидячий', SleepWagon: 'Спальный', EconomWagon: 'Плацкартный', CoupeWagon: 'Купейный' }.freeze

  belongs_to :train
  validates :number, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :sorted, -> (arg) { arg ? order(number: :desc) : order(number: :asc)  }
  scope :coupe, -> { where(type: :CoupeWagon) }
  scope :econom, -> { where(type: :EconomWagon) }
  scope :seat, -> { where(type: :SeatWagon) }
  scope :sleep, -> { where(type: :SleepWagon) }

  private

  def set_number
    self.number = train.wagons.maximum(:number).to_i + 1
  end
end
