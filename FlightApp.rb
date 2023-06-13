require_relative './config/environment'

class FlightApp 

    # initialized
    def initialize

        loop do
            option = display_menu

            if option == "1"
                show_all_passengers
            elsif option == "2"
                show_all_flights
            elsif option == "3"
                show_all_airplanes
            elsif option == "4"
                show_flights_to_sydney
            elsif option == "5"
                show_flights_to_perth
            elsif option == "a"
                search_passenger_name
            elsif option == "b"
                search_flight
            elsif option == "c"
                search_departure_date
            elsif option == "0"
                break
            else
                puts "MESSAGE: option INVALID!"
            end
        end 
    end

    #display
    def display_menu
        puts "\n"
        puts "----------------------------------------"
        puts "<<<<<<<<FLIGHT MANAGEMENT SYSTEM>>>>>>>>"
        puts "----------------------------------------"
        puts "MENU:"
        puts "\n"
        puts "[ 1 ] - Show all passengers"
        puts "[ 2 ] - Show all flights"
        puts "[ 3 ] - Show all airplanes"
        puts "[ 4 ] - Show flights to Sydney"
        puts "[ 5 ] - Show flights to Perth"
        puts "[ a ] - Search Passenger Name"
        puts "[ b ] - Search Flight Number"
        puts "[ c ] - Search Departure Date"
        puts "[ 0 ] - Exit"
        print "\nENTER OPTION: "

        input = get_input
        puts "\n"
        input
    end

    #search all passengers
    def show_all_passengers
        puts "ALL PASSENGERS"
        puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "PASSENGER ID\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\t\t\tHOME_ADDRESS\t\t\t\tMOBILE_NO\t\tPASSPORT_NO"
        puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

        Passenger.order(first_name: :asc).each do |passenger|
            puts "#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t#{passenger.mobile_no}\t\t#{passenger.passport_no}"
        end

        puts "\nTOTAL PASSENGERS: #{Passenger.all.size}"
        puts "\n------------------------------------------------------------------------------------------------------END----------------------------------------------------------------------------------------------------------"
    end


    #show all flights
    def show_all_flights 
        puts "ALL FLIGHTS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tDEPARTURE_TIME\t\t\tARRIVAL_TIME\t\tDURATION_IN_MINS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.order(departure: :asc).each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{Flight.all.size}"
        puts "\n--------------------------------------------------------------------END----------------------------------------------------------------------------------"
    end


    #show all airlines
    def show_all_airplanes
        puts "ALL AIRPLANES"
        puts "-----------------------------------------------------"
        puts "AIRLINE_ID\tAIRPLANE\tMODEL_NO"
        puts "-----------------------------------------------------"

        Airplane.order(name: :asc).each do |airplane|
            puts "#{airplane.id}\t\t#{airplane.name}\t\t#{airplane.model_no}"
        end

        puts "\nTOTAL AIRPLANES: #{Airplane.all.size}"
        puts "\n-----------------END--------------------------------"
    end


    #show flights to Sydney
    def show_flights_to_sydney
        puts "FLIGHTS TO SYDNEY"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(to: "Sydney").order(departure: :asc).each do |flight|
          puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.size}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"
    end


    #show flights to Perth
    def show_flights_to_perth
        puts "FLIGHTS TO PERTH"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(to: "Perth").order(departure: :asc).each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.size}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"
    end


    #seach passenger 
    def search_passenger_name
        print "Enter First Name: "
        first_name = get_input
        print "Enter Last Name: "
        last_name = get_input
        passenger = search(first_name, last_name)

        if passenger 
            puts "-------------------------------------------------------------------------"
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<FLIGHT DETAILS>>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "-------------------------------------------------------------------------"

            puts "\nPassenger ID: #{passenger.id}
            \nFull Name: #{passenger.first_name} #{passenger.last_name}"
            puts "\n"

            airline = Passenger.find("#{passenger.id}").reservations.first.airplane
            puts "\nAirline: #{airline.name} \n\nModel No.: #{airline.model_no}"

            flight = Passenger.find("#{passenger.id}").reservations.first.flight
            puts "\nFlight No.: #{flight.flight_no}
            \nFrom: #{flight.from}
            \nTo: #{flight.to}
            \nDeparture: #{flight.departure}
            \nArrival: #{flight.arrival}
            \nDuration_in_mins: #{flight.duration_in_mins} "
            puts "\n----------------------------------END-----------------------------------"
        else  
            puts "\nMessage: NO PASSENGER EXISTS IN OUR RECORDS!"
        end
    end


    #search full name
    def search(first_name, last_name)
        Passenger.where('UPPER(first_name) = ? AND UPPER(last_name) = ?', first_name.upcase, last_name.upcase).first
    end


    #search flight
    def search_flight
        print "Enter Flight Number: "
        flight_no = get_input
        flight = Flight.find_by(flight_no: flight_no.upcase)

        if flight
            airline = flight.reservations.first.airplane

            passengers = flight.reservations.map do |reservation|
                reservation.passenger
            end.flatten.compact

            puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
            puts "AIRLINE\t\tMODEL_NO\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
            puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
            puts "\n#{airline.name}\t\t#{airline.model_no}\t\t#{flight.flight_no}\t\t#{flight.from}\t #{flight.to}\t\t #{flight.departure}\t #{flight.arrival}\t#{flight.duration_in_mins}"
            puts "\n"
            puts "NAME OF PASSENGERS: "
            puts "\n"

            passengers.each do |passenger|
                puts "- #{passenger.first_name} #{passenger.last_name}"
            end

            puts "\nTotal number of passengers: #{passengers.size} "
            puts "\n-----------------------END-----------------------------"
        else  
            puts "\nMessage: NO FLIGHT FOUND!"
        end
    end

    
    #search departure_date
    def search_departure_date
        print "Enter departure date : "
        input = get_input
        date = Flight.find_by(departure: input)
       
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        if date
            puts "#{date.id}\t\t#{date.flight_no}\t\t#{date.to}\t\t#{date.from}\t#{date.departure}\t\t#{date.arrival}\t\t#{date.duration_in_mins}"
        else
            puts "\nMessage: NO FLIGHT RECORDS FOR THIS DATE!"
        end
    end 

    
    #chomp -and strip inputs
    def get_input
        STDIN.gets.chomp.strip
    end

end

FlightApp.new

