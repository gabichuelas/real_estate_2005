class House
  attr_reader :price, :address, :rooms, :rooms_by_category
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    true if @price > 500000
  end

  def rooms_from_category(category)
    rooms_by_category[category]
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

  def area
    @rooms.reduce(0) do |sum, room|
      sum += room.area
    end
  end

  def details
    Hash.new.merge("price" => @price, "address" => @address)
  end

  def price_per_square_foot
    @price.fdiv(area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end
end
