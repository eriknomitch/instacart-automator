class Cart < AttributeInitializable
  def self.clear
    @@browser.execute_script("$('.remove-item').click()")
  end

  def self.place_order
    @@browser.find_element(:class => "btn-checkout").click
  end
end
