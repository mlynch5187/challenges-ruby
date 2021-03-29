class Dock
  attr_reader :name, :max_rental_time, :rental_log
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    rental_log[boat] = renter
  end

  def charge(boat)
    charges = {}
    charges[:card_number] = @rental_log[boat].credit_card_number
    if boat.hours_rented <= max_rental_time
      charges[:amount] = (boat.hours_rented * boat.price_per_hour)
    else
      charges[:amount] = (max_rental_time * boat.price_per_hour)
    end
    charges
  end
end
