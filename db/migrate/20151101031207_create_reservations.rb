class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
			t.datetime :start_date,   null: false
			t.datetime :end_date,   null: false
			t.integer :person, default: 0
			t.string :room_inquiry
			t.string :meal_inquiry
			t.string :etc_inquiry
			t.string :phone_number,   null: false
      t.timestamps null: false
    end
  end
end
