class RoutesController < ApplicationController
  
  def index
    @routes = Route.all
  end


  def search 
    # binding.b
    @routes = Route.all
    @from= params[:from]
    @to= params[:to]
    @date = params[:date]

    @all_station = Station.eager_load(:route)
    @s_name = @all_station.pluck(:station_name)
    
    if (@s_name.include?(@from) && @s_name.include?(@to))
      @a = Station.find_by(station_name:@from) 
      @b = Station.find_by(station_name:@to)  
      if @a.id < @b.id
        @departure = @a.departure
        @arrival = @b.arrival
        @total_distance = @b.distance - @a.distance
        @fairprice = (@total_distance * 5)
        @route = Route.find_by(id:@a.route_id)
      else 
        redirect_to root_path
        flash[:message] = "No train available"
      end
    else 
      redirect_to root_path
      flash[:message] = "No train available"
    end
  end



  def pnr 
    @routes = Route.all
    @pnr = params[:pnr]
    # @ticke = Ticket.find_by(pnr:@pnr)
    @status = "confirm"
  end

  def trainroute 

  end


  # def new 
  #  @route = Route.new
  #  end
 
  # def create  
  #  @route = Route.new(route_param)
  #    if @route.save 
  #      redirect_to root_path 
  #    else
  #      render 'new'
  #    end
  #  end

  # def route_param
  #   params.require(:route).permit(:name) 
  # end

end
