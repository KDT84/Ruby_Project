# PROJECT NAME
- AIRLINE MANAGEMENT SYSTEM APP

# PROJECT DESCRIPTION

  This App contains records of all the flights, reservations, passengers and airplanes from below routes:
  -Melbourne to Sydney
  -Melbourne to Perth
  -Queensland to Sydney
  -Queensland to Perth 

# AUTHOR
- Kathyrine Dela Torre
  
# TECHNOLOGIES
-VS Code
-Ruby

# CHALLENGES 
- For convenience, I used Faker Gem to populate my database. I didn't quite encounter difficulties while doing this project as the requirements are just basic. 
- I would love to add more features in my free time to learn more about how it really works under the hood. 

# FEATURES
This App allows you to:
- Search all passengers,
- Seach all flights,
- Search all airplanes,
- Search for a certain passenger by its full name,
- Search for a certain flight by its flight number,
- Search flights from a certain destination, and
- Seach flights from where it departs.

# MODELS
 This Project is intended for school purposes only.
 - Airplane 
  - name
  - mode_no

- Flight 
  - flight_no
  - to
  - from
  - departure
  - arrival
  - duration

- Passenger 
  - first_name
  - last_name
  - dob
  - sex
  - email_address
  - home_address
  - mobile_no
  - passport_no
  
- Reservation 
  - airplane_id
  - passenger_id
  - flight_id
  - price


# HOW TO INSTALL AND RUN THE PROJECT
- bundle init (initaliaze the gemfile)
- bundle install (install gems required for the program)
- ruby FlightApp (to run the program)
- rake console (if you want to investigate the code within the binding)

# HOW TO USE THE PROJECT
- Video available on youtube.

# ACKNOWLEDGEMENT
- Frae VAldueza, Academy Xi

# PROJECT STATUS
- Done but with basic features.









