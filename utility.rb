def fill_input_with(id, value)
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)

  input = wait.until {
      element = @@browser.find_element(:id, id)
      element if element.displayed?
  }
  input.send_keys(value)
end

def clear_cart()
  @@browser.execute_script("$('.remove-item').click()")
end

