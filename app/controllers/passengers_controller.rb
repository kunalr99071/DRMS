class PassengersController < ApplicationController

  def index 
    @passengers = Passenger.all
    @ticket = Ticket.find(params[:ticket_id])
  
  end 

  
  def new 
    @passenger = Passenger.new
   end
 
  def create  
    ticket = Ticket.find(params[:ticket_id])
    @passenger = ticket.passengers.new(passenger_params)
     if @passenger.save 
       redirect_to ticket_passengers_path 
     else
       render 'new', status: :unprocessable_entity 
     end
   end

  def passenger_params
    params.require(:passenger).permit(:name,:age,:mobile,:gender,:ticket_id) 
  end

end
