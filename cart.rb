class Cart < AttributeInitializable
  def self.clear
    @@browser.execute_script("$('.remove-item').click()")
  end

  def self.place_order

    @@browser.execute_script("$('.btn-checkout').click()")

    sleep 2

    # Select first credit card
    puts "Selecting first credit card..."
    @@browser.execute_script("$('#credit_card_id').val($('#credit_card_id option:first').val())")
    sleep 1

    # Select first address
    puts "Selecting first address..."
    @@browser.execute_script("$('#address_id').val($('#address_id option:first').val())")
    sleep 1

    # Set policy to "Shoppers Choice"
    puts "Setting policy to 'Shoppers Choice'..."
    @@browser.execute_script("$('#order_replacement_policy_shoppers_choice').click()")
    sleep 1

    # Select the "Immediate" option
    puts "Selecting 'Immediate' delivery timeframe option..."
    @@browser.execute_script("$('#delivery_option_1').val(1)")
    sleep 1
  end
end
