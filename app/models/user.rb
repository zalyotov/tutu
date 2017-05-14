class User < ApplicationRecord
  # пользователь может иметь много билетов
  has_many :tickets

  validates :first_name, :last_name, presence: true
end
