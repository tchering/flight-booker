require "pry-byebug"

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    # @booking = Booking.new(flight: @flight)
    @passengers = params[:passengers_num].to_i
    @passengers.times { @booking.passengers.build }

    # binding.pry
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger, flight: @flight, booking: @booking).deliver_booking_confirmation.deliver_later
      end
      flash[:notice] = "Your booking has been successfully created with booking id #{@booking.id}"
      redirect_to booking_path(@booking)
    else
      flash[:notice] = "Cannot create booking"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.includes(:passengers).find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @booking }
      # format.xml {render xml: @booking} same as above
      format.json { render json: @booking.as_json(include: :passengers) }
      format.json { render json: @booking.as_json(include: { passengers: { only: [:email] } }) }
      # If you need to include associated records (e.g., passengers), you should use as_json to specify the customization:
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
