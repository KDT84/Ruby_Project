class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :airplane_id
      t.integer :passenger_id
      t.integer :flight_id
      t.decimal :price
    end
  end
end
