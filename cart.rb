class Cart < AttributeInitializable
  def self.clear
    @@browser.execute_script("InstacartStore.cart.clear()")
  end

  def self.place_order
    # Click "Place Order"
    @@browser.element(:xpath, "//a[@href='#checkout']").click

    # Select first credit card
    puts "Selecting first credit card..."
    select_index_in_select_list("credit_card_id", 1)

    # Select first address
    puts "Selecting first address..."
    select_index_in_select_list("address_id", 1)

    # Set policy to "Shoppers Choice"
    puts "Setting policy to 'Shoppers Choice'..."
    @@browser.element(:xpath, "//input[@id='order_replacement_policy_shoppers_choice']").click

    #@@browser.element(:xpath, "//body").click
    binding.pry

    # Select the "Immediate" option
    puts "Selecting 'Immediate' delivery timeframe option..."
    select_first_non_empty_value_in_select_list "delivery_option_1"
  end
end
