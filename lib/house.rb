class House
  attr_reader :price, :address, :rooms
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
    room_category_hash =
    @rooms.group_by do |room|
      room.category
    end
    room_category_hash[category]
  end

  def area
    @rooms.reduce(0) do |sum, room|
      sum += room.area
    end
  end

  def details
    Hash.new.merge("price" => @price, "address" => @address)
  end

end
