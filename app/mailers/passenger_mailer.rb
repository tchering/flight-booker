class PassengerMailer < ApplicationMailer
  default from: "noreply@example.com"
  before_action :set_passenger, :set_booking, :set_flight
  after_deliver :last_delivered

  def deliver_booking_confirmation
    mail(
      to: @passenger.email,
      subject: "Booking Confirmation",
    )
  end

  private

  def set_passenger
    @passenger = params[:passenger]
  end

  def set_booking
    @booking = params[:booking]
  end

  def set_flight
    @flight = params[:flight]
  end

  def last_delivered
    params[:passenger].touch(:last_delivered)
  end
end
