**Seeding Airline:

# ----------------------------------------------------Airline
Airline.create(name: "Jetstar", model_no: 111)
Airline.create(name: "Qantas", model_no: 111)
Airline.create(name: "Virgin Australia", model_no: 111)
# -----------------------------------------------Passenger-----------------------------------

**Seeding Passenger:

Passenger.create(
    given_name: "Julia",
    surname: "Robbs",
    dob: "12-02-1960",
    sex: "female",
    email_address: "jul@gmail.com"
    home_address: "123 Burnett Street Parramatta, Australia",
    mobile_no: "+63-473-188-923"
    passport_no: "EDN 1556"
)
Passenger.create(
    given_name: "Brad",
    surname: "Pi",
    dob: "12-02-1970",
    sex: "male",
    email_address: "brad@yahoo.com"
    home_address: "37 Ken Street Sydney Australia",
    mobile_no: "+63-473-188-923"
    passport_no: "EDN 1556"
)
Passenger.create(
    given_name: "Jennifer",
    surname: "Gar",
    dob: "12-02-1984",
    sex: "female",
    email_address: "jenn@yahoo.com"
    home_address: "8 Blaxland Street Perth Australia",
    mobile_no: "+63-473-188-923"
    passport_no: "EDN 1556"
)


# --------------------------------------------Flight-----------------------------------
Flight.create(airline_id: 1, passenger_id: 1, flight_details: 1)
Flight.create(airline_id: 2, passenger_id: 2, flight_details: 2)
Flight.create(airline_id: 3, passenger_id: 3, flight_details: 3)
Flight.create(airline_id: 4, passenger_id: 4, flight_details: 4)
Flight.create(airline_id: 5, passenger_id: 5, flight_details: 5)




# --------------------------------------------Flight Details-----------------------------------

FlightDetails.create(
    flight_no:1, 
    from: "Sydney Australia", 
    to: "Changi Singapore",
    departure_date: "10-07-2023"
    departure_time: "10:00"
    arrival_time: "22:30"
    duration: "8 hrs and 30 mins"  
)
FlightDetails.create(
    flight_no:2, 
    from: "Sydney Australia", 
    to: "Changi Singapore",
    departure_date: "10-07-2023"
    departure_time: "10:00"
    arrival_time: "22:30"
    duration: "8 hrs and 30 mins"  
)

