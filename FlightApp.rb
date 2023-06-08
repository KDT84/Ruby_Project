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
                show_flights_from_queensland
            elsif option == "5"
                show_flights_from_melbourne
            elsif option == "6"
                show_flights_to_sydney
            elsif option == "7"
                show_flights_to_perth
            elsif option == "8"
                all_passengers_from_queensland
            elsif option == "9"
                all_passengers_from_melbourne
            elsif option == "a"
                search_passenger_name
            elsif option == "b"
                search_flight
            elsif option == "0"
                break
            elsif option == "c"
                departure
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
        puts "[ 3 ] - Show all airlines"
        puts "[ 4 ] - Show flights from Queensland"
        puts "[ 5 ] - Show flights from Melbourne"
        puts "[ 6 ] - Show flights to Sydney"
        puts "[ 7 ] - Show flights to Perth"
        puts "[ 8 ] - All passengers from Queensland"
        puts "[ 9 ] - All passengers from Melbourne"
        puts "[ a ] - Search Passenger Name"
        puts "[ b ] - Search Flight Number"
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
        puts "ID\t\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\t\t\tHOME_ADDRESS\t\t\t\tMOBILE_NO\t\tPASSPORT_NO"
        puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

        Passenger.all.each do |passenger|
            puts "#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t#{passenger.mobile_no}\t\t#{passenger.passport_no}"
        end

        puts "\nTOTAL PASSENGERS: #{Flight.all.length}"
        puts "\n------------------------------------------------------------------------------------------------------END----------------------------------------------------------------------------------------------------------"
    end

    #show all flights
    def show_all_flights 
        puts "ALL FLIGHTS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tDEPARTURE_TIME\t\t\tARRIVAL_TIME\t\tDURATION_IN_MINS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{Flight.all.length}"
        puts "\n--------------------------------------------------------------------END----------------------------------------------------------------------------------"

    end

    #show all airlines
    def show_all_airplanes
        puts "ALL AIRPLANES"
        puts "-----------------------------------------------------"
        puts "AIRLINE_ID\tAIRPLANE\tMODEL_NO"
        puts "-----------------------------------------------------"

        Airplane.all.each do |airplane|
            puts "#{airplane.id}\t\t#{airplane.name}\t\t#{airplane.model_no}"
        end

        puts "\nTOTAL AIRPLANES: #{Airplane.all.length}"
        puts "\n-----------------END--------------------------------"

    end

    #show flights from Queensland
    def show_flights_from_queensland
        puts "FLIGHTS FROM QUEENSLAND"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(from: "Queensland").each do |flight|
          puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.length}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"

    end

    def show_flights_from_melbourne
        puts "FLIGHTS FROM MELBOURNE"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(from: "Melbourne").each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.length}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"
    end


    #shoe flights to Sydney
    def  show_flights_to_sydney
        puts "FLIGHTS TO SYDNEY"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(to: "Sydney").each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.length}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"
    end

    #show flights to Perth
    def show_flights_to_perth
        puts "FLIGHTS TO PERTH"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        flights = Flight.where(to: "Perth").each do |flight|
             puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end

        puts "\nTOTAL FLIGHTS: #{flights.length}"
        puts "\n------------------------------------------------------------END------------------------------------------------------------------------------------------"
    end

    #seach passenger
    def search_passenger_name
        print "Enter First Name: "
        first_name = get_input

        print "Enter Last Name: "
        last_name = get_input

        passenger = search(first_name.strip, last_name.strip)
        if passenger 
            puts "-------------------------------------------------------------------------"
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<PASSENGER DETAILS>>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "-------------------------------------------------------------------------"
            puts "\nID: #{passenger.id}
            \nFirst Name: #{passenger.first_name}
            \nLast Name: #{passenger.last_name}
            \nDOB: #{passenger.dob}
            \nSex: #{passenger.sex}
            \nEmail Address: #{passenger.email_address}
            \nHome Address: #{passenger.home_address}
            \nMobile No: #{passenger.mobile_no}
            \nPassport No.: #{passenger.passport_no}"
            puts "\n----------------------------------END-----------------------------------"

        else  
            puts "\nMessage: PASSENGER NOT FOUND!"
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
            puts "---------------------------------------------------------"
            puts "<<<<<<<<<<<<<<<<<<<<FLIGHT DETAILS>>>>>>>>>>>>>>>>>>>>>>>"
            puts "---------------------------------------------------------"
            puts "\nID: #{flight.id}
            \nFLIGHT NO.: #{flight.flight_no}
            \nFROM: #{flight.from}
            \nTO: #{flight.to}
            \nDEPARTURE: #{flight.departure}
            \nARRIVAL: #{flight.arrival}
            \nDURATION IN MINS: #{flight.duration_in_mins}"
            puts "\n-----------------------END-----------------------------"

        else  
            puts "\nMessage: FLIGHT NOT FOUND!"
        end
    end

    # show passengers from Queensland
    def all_passengers_from_queensland
        passengers = Flight.where(from: "Queensland").map do |flight|
            flight.reservations.map { |reservation| reservation.passenger }
        end.flatten.compact

        puts "\nALL PASSENGERS FROM QUEENSLAND"
        puts "---------------------------------------------"
        puts "ID\tFIRST_NAME\tLAST_NAME"
        puts "---------------------------------------------"
        passengers.each do |passenger|
            puts "#{passenger.id}\t#{passenger.first_name}\t\t#{passenger.last_name}"
        end

        puts "\nTOTAL PASSENGERS: #{passengers.length}"
        puts "\n----------------END------------------------"
    end

    # show passengers from Melbourne
    def all_passengers_from_melbourne
        passengers = Flight.where(from: "Melbourne").map do |flight|
            flight.reservations.map { |reservation| reservation.passenger }
        end.flatten.compact

        puts "\nALL PASSENGERS FROM MELBOURNE"
        puts "---------------------------------------------"
        puts "ID\tFIRST_NAME\tLAST_NAME"
        puts "---------------------------------------------"

        passengers.each do |passenger|
            puts "#{passenger.id}\t#{passenger.first_name}\t\t#{passenger.last_name}"
        end

        puts "\nTOTAL PASSENGERS: #{passengers.length}"
        puts "\n----------------END------------------------"
    end
    
    #chomp and strip inputs
    def get_input
        STDIN.gets.chomp.strip
    end

end

FlightApp.new

