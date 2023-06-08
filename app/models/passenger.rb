class Passenger < ActiveRecord::Base 
    has_many :reservations
    has_many :airplanes, through: :reservations    
end