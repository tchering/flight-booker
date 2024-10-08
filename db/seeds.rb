# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# to truncate table before seeding from rails console
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE airports RESTART IDENTITY CASCADE")
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE flights RESTART IDENTITY CASCADE")
# seeds airports for column code ,name,country, city

Airport.create(code: "JFK", name: "John F. Kennedy International Airport", country: "United States", city: "New York")
Airport.create(code: "LAX", name: "Los Angeles International Airport", country: "United States", city: "Los Angeles")
Airport.create(code: "LHR", name: "London Heathrow Airport", country: "United Kingdom", city: "London")
Airport.create(code: "CDG", name: "Paris Charles de Gaulle Airport", country: "France", city: "Paris")
Airport.create(code: "HND", name: "Tokyo Haneda Airport", country: "Japan", city: "Tokyo")
Airport.create(code: "PVG", name: "Shanghai Pudong International Airport", country: "China", city: "Shanghai")
Airport.create(code: "SYD", name: "Sydney Kingsford Smith Airport", country: "Australia", city: "Sydney")
Airport.create(code: "DXB", name: "Dubai International Airport", country: "United Arab Emirates", city: "Dubai")
Airport.create(code: "AMS", name: "Amsterdam Airport Schiphol", country: "Netherlands", city: "Amsterdam")
Airport.create(code: "FRA", name: "Frankfurt Airport", country: "Germany", city: "Frankfurt")
Airport.create(code: "SIN", name: "Singapore Changi Airport", country: "Singapore", city: "Singapore")
Airport.create(code: "ICN", name: "Incheon International Airport", country: "South Korea", city: "Seoul")
Airport.create(code: "MUC", name: "Munich Airport", country: "Germany", city: "Munich")
Airport.create(code: "MAD", name: "Adolfo Suárez Madrid–Barajas Airport", country: "Spain", city: "Madrid")
Airport.create(code: "BCN", name: "Barcelona–El Prat Josep Tarradellas Airport", country: "Spain", city: "Barcelona")
Airport.create(code: "JNB", name: "O. R. Tambo International Airport", country: "South Africa", city: "Johannesburg")
Airport.create(code: "IST", name: "Istanbul Airport", country: "Turkey", city: "Istanbul")

# seeds 10 Flights data
# seeds multiple flights per day including return flights
50.times do
  departure_airport = Airport.all.sample
  arrival_airport = Airport.all.sample
  while departure_airport == arrival_airport
    arrival_airport = Airport.all.sample
  end

  # Create multiple flights per day
  3.times do |i|
    departure_time = Time.now + rand(1..100).days + i.hours
    Flight.create(departure_id: departure_airport.id, arrival_id: arrival_airport.id, departure_date: departure_time, duration: rand(1..24))

    # Create return flight
    return_time = departure_time + rand(1..10).days + rand(1..24).hours
    Flight.create(departure_id: arrival_airport.id, arrival_id: departure_airport.id, departure_date: return_time, duration: rand(1..24))
  end
end
