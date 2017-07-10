class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  def new
    @ticket = Ticket.new
  end

  def index
    @tickets = Ticket.all
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to admin_ticket_path(@ticket), notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket), notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  def show    
  end

  private

  def ticket_params
    params.require(:ticket).permit(:owner_name, :passport_number, :train_id, :first_station_id, :last_station_id, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end