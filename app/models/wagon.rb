class Wagon < ApplicationRecord
  TYPE = { econom: 'Плацкартный', compartment: 'Купейный' }.freeze

  belongs_to :train
end
