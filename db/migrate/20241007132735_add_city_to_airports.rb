class AddCityToAirports < ActiveRecord::Migration[7.1]
  def change
    add_column :airports, :city, :string
  end
end
