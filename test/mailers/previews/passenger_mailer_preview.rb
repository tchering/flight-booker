# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def deliver_booking_confirmation
    passenger = Passenger.first
    flight = Flight.first
    booking = Booking.first
    PassengerMailer.with(passenger: Passenger.first, flight: Flight.first, booking: Booking.first).deliver_booking_confirmation
  end
end
