class Item < AttributeInitializable
  @items = []

  attr_accessor :id, :quantity

  def add()
    puts "Adding item #{id}..."
    @@browser.execute_script("InstacartStore.cart.addItem(#{id}, #{quantity})")
  end

  def self.add_items
    Item.items.map(&:add)
  end

  def self.items
    @items
  end

  def self.define(id, quantity)
    item = Item.new(:id => id, :quantity => quantity)
    @items << item
  end
end
