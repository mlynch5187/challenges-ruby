class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price.scan(/[.0-9]/).join().to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 400000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category === category}
  end

  def area
    @rooms.sum { |room| room.area }
  end
end
