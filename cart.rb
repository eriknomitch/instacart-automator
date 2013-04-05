class Cart < AttributeInitializable
  def self.clear
    @@browser.execute_script("$('.remove-item').click()")
  end

  def self.place_order
    @@browser.execute_script("$('.btn-checkout').click()")
  end
end
