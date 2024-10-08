class FlightsController < ApplicationController
  def index
    @airport_name_option = Airport.all.map { |airport| [airport.name, airport.id] }
    @flight_date_option = Flight.all.map { |flight| [flight.departure_date.strftime("%a, %Y-%m-%d"), flight.id] }
    @passenger_options = (1..4).to_a
    @passengers = params[:passenger_no]

    @flights = Flight.includes(:departure_airport, :arrival_airport).all
    @flights = @flights.where(departure_id: params[:departure_id]) if params[:departure_id].present?
    @flights = @flights.where(arrival_id: params[:arrival_id]) if params[:arrival_id].present?
    if params[:departure_date].present?
      begin
        departure_date = Date.parse(params[:departure_date])
        @flights = @flights.where(departure_date: departure_date.beginning_of_day..departure_date.end_of_day)
      rescue Date::Error
        flash[:alert] = "Invalid date format"
      end
    end
  end

  def new
  end
end
