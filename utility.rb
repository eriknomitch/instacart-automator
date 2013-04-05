def fill_input_with(id, value)
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)

  input = wait.until {
      element = @@browser.find_element(:id, id)
      element if element.displayed?
  }
  input.send_keys(value)
end

# FIX: Monkey patch SelectList
def select_index_in_select_list(id, index)
  @@browser.select_list(:id => id).select_value(@@browser.select_list(:id => id).options[index].value)
end

def select_first_non_empty_value_in_select_list(id)
  options          = @@browser.select_list(:id => id).options
  option_to_select = false

  options.each do |option|
    unless option.value.empty?
      option_to_select = option
      break
    end
  end

  @@browser.select_list(:id => id).select_value(option_to_select.value)
end
