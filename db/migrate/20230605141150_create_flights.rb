class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :flight_no
      t.string :from
      t.string :to 
      t.datetime :departure
      t.integer :duration_in_mins
      t.datetime :arrival
    end
  end
end
