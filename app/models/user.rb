class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  # пользователь может иметь много билетов
  has_many :tickets
end
