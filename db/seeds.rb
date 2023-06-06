# puts "🌱 SEEDING DATA....."

# Airplane.delete_all
# Flight.delete_all 
# Passenger.delete_all 
# Reservation.delete_all

# 2.times do

#     airplane = Airplane.create(
#         name: ["Qantas", "Jetstar", "Virgin Australia"].sample,
#         model_no: ['737', '777', '777', '787'].sample + "-" + rand(100..999).to_s
#     )

#     dep = ["2023-12-24 08:00 +11:00", "2023-12-24 10:00 +11:00", "2023-12-24 14:00 +11:00"].sample
#     dep_time = Time.parse(dep)

#     flight = Flight.create(
#         flight_no: Faker::Alphanumeric.alpha(number: 2).upcase + " " + rand(1000..9999).to_s,
#         from: ["Melbourne", "Queensland"].sample,
#         to: ["Sydney", "Perth"].sample,
#         departure: dep,
#         arrival: dep_time + 80.minutes,
#         duration_in_mins: 80
#     )

#     10.times do
#         passenger = Passenger.create(
#             first_name: Faker::Name.first_name,
#             last_name: Faker::Name.last_name,
#             dob: Faker::Date.between(from: 50.years.ago, to: 18.years.ago).to_s(:db),
#             sex: ["male", "female"].sample,
#             email_address: Faker::Internet.user(:email)[:email],
#             home_address: Faker::Address.full_address,
#             mobile_no: Faker::PhoneNumber.cell_phone,
#             passport_no: Faker::Alphanumeric.alpha(number: 2).upcase + Faker::Alphanumeric.alphanumeric(number: 7, min_alpha: 0, min_numeric: 7)
#         )


#         reservation = Reservation.create(
#             price: [450.34, 560.23, 349.23, 250.50].sample,
#             airplane_id: airplane.id,
#             passenger_id: passenger.id,
#             flight_id: flight.id
#         )

#     end 
# end

# puts "🌱 FINISHED SEEDING!!!!"


