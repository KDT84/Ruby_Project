class Passenger < ActiveRecord::Base 
    has_many :reservations
    has_many :airplanes, through: :reservations

    def full_name
        "Full Name: #{self.first_name} #{self.last_name}"
    end 
    
end