class Passenger < ActiveRecord::Base 
    has_many :reservations
    has_many :airplanes, through: :reservations    

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


    def self.search(first_name, last_name)
        Passenger.where('UPPER(first_name) = ? AND UPPER(last_name) = ?', first_name.upcase, last_name.upcase).first
    end
    
end