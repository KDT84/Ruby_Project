require_relative './config/environment'
# require_relative './flight.rb'
# require_relative './passenger.rb'
# require_relative './reservation.rb'

class FlightApp 

    def initialize
        # puts "--------------------------------"
        # puts "<<<<<<<<FLIGHT RECORDS>>>>>>>>>>"
        # puts "--------------------------------"


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
                show_all_passengers_from_queensland
            elsif option == "0"
                puts "Thank you and enjoy your flight!"
                break
            else
                puts "ERROR MESSAGE: option INVALID!"
            end
            
        end 
    end

    def display_menu
        puts "\n"
        puts "--------------------------------"
        puts "<<<<<<<<FLIGHT RECORDS>>>>>>>>>>"
        puts "--------------------------------"

        puts "MENU:"
        puts "\n"
        puts "1 - Show all passengers"
        puts "2 - Show all flights"
        puts "3 - Show all airlines"
        puts "4 - Show flights from Queensland"
        puts "5 - Show flights from Melbourne"
        puts "6 - Show flights to Sydney"
        puts "7 - Show flights to Perth"
        puts "8 - show_all_passengers_from_queensland"
        puts "0 - Exit"

        puts "\nENTER OPTION : "

        input = get_input
        puts "\n\n"
        input

    end

    # def show_all_passengers_from_queensland
    #     puts "ALL PASSENGERS"
    #     puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    #     puts "ID\t\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\tHOME_ADDRESS\t\t\t\t\t\t\t\t\tMOBILE_NO\t\t\t\tPASSPORT_NO"
    #     puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

    #     passengers = Flight.all.filter{|flight| flight.from == 'Queensland'}.map do |flight|
    #       flight.reservations.map do |reservation|
    #         reservation.passenger
    #       end
    #     end.flatten.compact

    #     passengers.each do |passenger|
    #         puts "#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t\t\t\t#{passenger.mobile_no}\t\t\t\t#{passenger.passport_no}"
    #     end
    # end

    def show_all_passengers
        puts "ALL PASSENGERS"
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "ID\t\tFIRST_NAME\tLAST_NAME\tDOB\t\tSEX\t\tEMAIL_ADDRESS\t\t\tHOME_ADDRESS\t\t\t\t\t\t\t\t\tMOBILE_NO\t\t\t\tPASSPORT_NO"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"


        Passenger.all.each do |passenger|
            puts "#{passenger.id}\t\t#{passenger.first_name}\t\t#{passenger.last_name}\t\t#{passenger.dob}\t#{passenger.sex}\t\t#{passenger.email_address}\t\t#{passenger.home_address}\t\t\t\t\t#{passenger.mobile_no}\t\t\t\t#{passenger.passport_no}"
        end
    end

    def show_all_flights 
        puts "ALL FLIGHTS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\t\tFROM\t\tDEPARTURE_TIME\t\t\tARRIVAL_TIME\t\t\tDURATION_IN_MINS"
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.each do |flight|
            puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.from}\t\t#{flight.to}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
        end
    end

    def show_all_airlines
        puts "ALL ARILINES"
        puts "-----------------------------------------------------"
        puts "AIRLINE_ID\tAIRLINE\t\tMODEL_NO"
        puts "-----------------------------------------------------"

        Airplane.all.each do |airplane|
            puts "#{airplane.id}\t\t#{airplane.name}\t\t#{airplane.model_no}"
        end

    end

    def show_flights_from_queensland
        puts "FLIGHTS FROM QUEENSLAND"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.filter do |flight|
            if flight.from == "Queensland"
                puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
            else
                nil
            end
        end
    end

    def show_flights_from_melbourne
        puts "FLIGHTS FROM MELBOURNE"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.filter do |flight|
            if flight.from == "Melbourne"
                puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
            else
                nil
            end
        end
    end

    def  show_flights_to_sydney
        puts "FLIGHTS TO SYDNEY"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.filter do |flight|
            if flight.to == "Sydney"
                puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
            else
                nil
            end
        end
    end

    def show_flights_to_perth
        puts "FLIGHTS TO PERTH"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "FLIGHT_ID\tFLIGHT_NO\tTO\t\tFROM\t\t\tFLIGHT_DEPARTURE\t\tFLIGHT_ARRIVAL\t\tDURATION_IN_MINS"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"

        Flight.all.filter do |flight|
            if flight.to == "Perth"
                puts "#{flight.id}\t\t#{flight.flight_no}\t\t#{flight.to}\t\t#{flight.from}\t\t#{flight.departure}\t\t#{flight.arrival}\t\t#{flight.duration_in_mins}"
            else
                nil
            end
        end
    end

    def get_input
        STDIN.gets.chomp
    end
end 

FlightApp.new