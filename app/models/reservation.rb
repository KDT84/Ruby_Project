class Reservation < ActiveRecord::Base

    belongs_to :airplane 
    belongs_to :passenger 
    belongs_to :flight

end