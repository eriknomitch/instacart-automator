class Item < AttributeInitializable
  @items = []

  attr_accessor :id, :quantity

  def add()
  end

  def self.items
    @items
  end

  def self.define(id, quantity)
    item = Item.new(:id => id, :quantity => quantity)
    @items << item
  end
end
