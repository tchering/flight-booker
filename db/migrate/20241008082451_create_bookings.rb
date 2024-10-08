class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      #Ex:- :default =>''
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
