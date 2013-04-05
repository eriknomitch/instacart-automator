class Item < AttributeInitializable
  @items = []

  attr_accessor :id, :quantity

  def add()
    puts "Adding item #{id}..."
    @@browser.execute_script("$('[data-item-id=\"#{id}\"]').find('.btn-add-to-cart').click()")

    if quantity > 1
      (quantity - 1).times do |index|
      end
      sleep 0.5
    end

    sleep 0.5
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
