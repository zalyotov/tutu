class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  # пользователь может иметь много билетов
  has_many :tickets

  validates :first_name, :last_name, presence: true
end
