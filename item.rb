class Item < AttributeInitializable
  @items = []

  attr_accessor :id, :quantity

  def add()
    puts "Adding item #{id}..."

    @@browser.execute_script("InstacartStore.cart.addItem(#{id}, #{quantity})")

    # Open the detailed view of the Item
    #@@browser.goto "http://instacart.com/store#items/#{id}"

    ## Click the "Add to Cart" button
    #@@browser.element(:xpath, "//header[@class='clearfix detail-he=> []]//button[@class='btn btn-large btn-qty inc']").click

    #@@browser.element(:xpath, "//li[@data-item-id='#{id}']//button[@class='btn btn-add-to-cart']").click

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
