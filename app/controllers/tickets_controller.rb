class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :qrcode)
    end
end
