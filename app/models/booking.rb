class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers

  def as_json(options = {})
    super(options.merge({ except: [:flight_id] }))
  end
end
