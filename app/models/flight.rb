class Flight < ActiveRecord::Base 
   has_many :reservations


   def self.flights_to_perth
      self.where(to: "Perth").order(departure: :asc)
   end

   def self.flights_to_sydney
      
      self.where(to: "Sydney").order(departure: :asc)
   end

end