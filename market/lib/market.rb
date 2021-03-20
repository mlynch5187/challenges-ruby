class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.include?(item)}
  end

  def total_inventory
    all_items = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq

      all_items.reduce({}) do |result, item|
      total_quantity = vendors_that_sell(item).sum do |vendor|
        vendor.inventory.sum do |inventory_item, quantity|
          if inventory_item == item
            quantity
          else
            0
          end
        end
      end
      result[item] = {quantity: total_quantity, vendors: vendors_that_sell(item)}
      result
    end
  end

  def overstocked_items
    require "pry"; binding.pry
  end
end
