class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def show    
  end

  private

  def ticket_params
    params.require(:ticket).permit(:owner_name, :passport_number, :train_id, :first_station_id, :last_station_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end