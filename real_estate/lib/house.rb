class House
  attr_reader :price, :address
  def initialize(price, address)
    @price = price.scan(/[.0-9]/).join().to_i
    @address = address
  end
end
