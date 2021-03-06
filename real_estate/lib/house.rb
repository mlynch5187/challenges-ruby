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
    @rooms.sum {|room| room.area}
  end

  def details
    house_info = {}
    house_info['price'] = @price
    house_info['address'] = @address
    house_info
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_by_category
    room_categories = {}
    @rooms.each do |room|
      room_categories[room.category] = []
    end
    room_categories.uniq.each do |room_category|
      room_category.flatten
    end
    room_categories
    @rooms.each do |room|
      if room_categories.include?(room.category)
        room_categories[room.category] <<room
      end
    end
    room_categories
  end
end
