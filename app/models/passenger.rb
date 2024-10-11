class Passenger < ApplicationRecord
  belongs_to :booking
  has_one :flight, through: :booking

  def as_json(options = {})
    super(options.merge({ only: [:email] }))
  end
end
