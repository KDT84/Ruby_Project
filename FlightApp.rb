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
                show_all_airlines
            elsif option == "4"
                show_flights_from_queensland
            elsif option == "5"
                show_flights_from_melbourne
            elsif option == "6"
                show_flights_to_sydney
            elsif option == "7"
                show_flights_to_perth
            elsif option == "8"
                search_passenger
            elsif option == "9"
                search_flight
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
        puts "-----------------------------------------------------"
        puts "<<<<<<<<<<<<<<<<<<<FLIGHT RECORDS>>>>>>>>>>>>>>>>>>>>"
        puts "-----------------------------------------------------"

        puts "MENU:"
        puts "\n"
        puts "1 - Show all passengers"
        puts "2 - Show all flights"
        puts "3 - Show all airlines"
        puts "4 - Show flights from Queensland"
        puts "5 - Show flights from Melbourne"
        puts "6 - Show flights to Sydney"
        puts "7 - Show flights to Perth"
        puts "8 - Search Passenger"
        puts "9 - Search Flight"
        puts "0 - Exit"

        print "\nENTER OPTION: "

        input = get_input
        puts "\n"
        input
    end

    #search all passengers
    def show_all_passengers
        puts "ALL PASSENGERS"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "ID\t\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\t\t\tHOME_ADDRESS\t\t\t\tMOBILE_NO\t\tPASSPORT_NO"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

        Passenger.all.each do |passenger|
            puts "#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t#{passenger.mobile_no}\t\t#{passenger.passport_no}"
        end
            
    end

    #show all flights
    def show_all_flights 
        puts "ALL FLIGHTS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\t\tFROM\t\tDEPARTURE_TIME\t\t\tARRIVAL_TIME\t\t\tDURATION_IN_MINS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.from}\t\t#{flight.to}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end

    #show all airlines
    def show_all_airlines
        puts "ALL AIRLINES"
        puts "-----------------------------------------------------"
        puts "AIRLINE_ID\tAIRLINE\t\tMODEL_NO"
        puts "-----------------------------------------------------"

        Airplane.all.each do |airplane|
            puts "#{airplane.id}\t\t#{airplane.name}\t\t#{airplane.model_no}"
        end

    end

    #show flights from Queensland
    def show_flights_from_queensland
        puts "FLIGHTS FROM QUEENSLAND"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.where(from: "Queensland").each do |flight|
          puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end

    def show_flights_from_melbourne
        puts "FLIGHTS FROM MELBOURNE"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.where(from: "Melbourne").each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end


    #shoe flights to Sydney
    def  show_flights_to_sydney
        puts "FLIGHTS TO SYDNEY"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.where(to: "Sydney").each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end

    #show flights to Perth
    def show_flights_to_perth
        puts "FLIGHTS TO PERTH"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.where(to: "Perth").each do |flight|
             puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end

    #seach passenger
    def search_passenger
        print "Enter First Name: "
        first_name = get_input

        print "Enter Last Name: "
        last_name = get_input

        puts "\nPASSENGER DETAILS"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "ID\t\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\t\t\tHOME_ADDRESS\t\t\t\tMOBILE_NO\t\tPASSPORT_NO"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

        passenger = search(first_name.strip, last_name.strip)

        if passenger 
            puts "\n#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t#{passenger.mobile_no}\t\t#{passenger.passport_no}"
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

        puts "\nFLIGHT DETAILS"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "ID\tFLIGHT_NO\tFROM\t\tTO\t\t\tDEPARTURE\t\t\tARRIVAL\t\t\tDURATION_IN_MINS"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

        flight = Flight.find_by(flight_no: flight_no.upcase)
        if flight
            puts "\n#{flight.id}\t#{flight.flight_no}\t\t#{flight.from}\t#{flight.to}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t\t#{flight.duration_in_mins}"
        else  
            puts "\nMessage: FLIGHT NOT FOUND!"
        end
    end

    #input
    def get_input
        STDIN.gets.chomp.strip
    end
end 

FlightApp.new