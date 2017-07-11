class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :index]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
    @tickets = current_user.tickets.all
  end

  def new
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @ticket.destroy
      redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
    end
  end

  def show    
  end

  def edit
  end

  private

  def ticket_params
    params.require(:ticket).permit(:owner_name, :passport_number, :train_id, :first_station_id, :last_station_id)
  end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
end