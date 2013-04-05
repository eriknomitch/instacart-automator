class Cart < AttributeInitializable
  def self.clear
    @@browser.execute_script("InstacartStore.cart.clear()")
  end

  def self.place_order
    # Click "Place Order"
    #@@browser.goto("#{TARGET_URL_PREFIX}/store#checkout")
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

    # Wait for the delivery timeframe options to show up
    sleep 1

    # Select the "Immediate" option
    puts "Selecting 'Immediate' delivery timeframe option..."
    select_first_non_empty_value_in_select_list "delivery_option_1"
  end
end
