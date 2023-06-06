class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :sex
      t.string :email_address
      t.string :home_address
      t.string :mobile_no
      t.string :passport_no
    end
  end
end
