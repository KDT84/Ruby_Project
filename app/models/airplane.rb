class Airplane < ActiveRecord::Base 

    has_many :reservations
    has_many :passengers, through: :reservations

    
end