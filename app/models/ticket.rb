class Ticket < ApplicationRecord
  # билет принадлежит пользователю, в котором указан номер поезда
  belongs_to :train
  belongs_to :user, optional: true
  # в билете указан пункт отправления и пункт назначения
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  after_create :send_buy_notification
  after_destroy :send_destroy_notification

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  validates :owner_name, :passport_number, presence: true

  private

  def send_destroy_notification
    TicketsMailer.destroy_ticket(self.user, self).deliver_now
  end

  def send_buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
