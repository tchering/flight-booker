class AddLastDeliveredToPassengers < ActiveRecord::Migration[7.1]
  def change
    add_column :passengers, :last_delivered, :datetime
  end
end
