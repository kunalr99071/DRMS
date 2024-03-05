class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @from = @ticket.from
    @to = @ticket.to
    @date = @ticket.date
    a = Station.find_by(station_name:@from)
    b = Station.find_by(station_name:@to)
    @total_distance = b.distance - a.distance
    @total_passenger = @ticket.passengers.count
    @fairprice = (@total_distance * 5)*@total_passenger 
    @status = "confirm"
  end

  def payment 
  end

  def new 
    @ticket = Ticket.new   
  end
 
  def create  
    route = Route.find(params[:route_id])
    @ticket = route.tickets.new(ticket_params)
    @pnr = rand.to_s[2..7]
     if @ticket.save 
      @ticket.update(pnr:@pnr)
      redirect_to new_ticket_passenger_path(@ticket.id) 
     else
       render 'new'
     end
   end

  def ticket_params
    params.require(:ticket).permit(:from,:to,:date,:mobile,:email) 
  end

end
