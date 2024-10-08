class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :arrival_id
      t.integer :departure_id
      t.datetime :departure_date
      t.integer :duration

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :arrival_id
    add_foreign_key :flights, :airports, column: :departure_id

    add_index :flights, :arrival_id
    add_index :flights, :departure_id
    add_index :flights, :departure_date
  end
end
