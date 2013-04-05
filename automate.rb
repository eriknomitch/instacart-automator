require 'rubygems'
require 'selenium-webdriver'

load 'utility.rb'
load 'attribute_initializable.rb'
load 'item.rb'

Item.define 42557, 3
Item.define 34180, 1
Item.define 40082, 1

# Initialize browser
@browser = Selenium::WebDriver.for :firefox
@browser.get "http://instacart.com/accounts/login"

# Fill in the Login form
fill_input_with "user_email",    "enomitch@gmail.com"
fill_input_with "user_password", "changeme123"

# Sign in
@browser.find_element(:name => "commit").click

  
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  
add_buttons = wait.until {
  #element = @browser.find_element(:xpath => "//*[@data-item-id=\"42557\"]/[@class=\"btn-add-to-cart\"]")
  #element = @browser.find_element(:xpath => "//*[@data-item-id=\"42557\"[button[@class=\"btn-add-to-cart\"]]]")
  #element = @browser.find_element(:xpath => "//*[@data-item-id=\"42557\"]/button[@class=\"btn-add-to-cart\"]")
  element = @browser.find_element(:xpath => "//*[@data-item-id=\"42557\"]")
  element if element.displayed?
}

# Add items
Item.items.each do |item|
  @browser.execute_script("$('[data-item-id=\"#{item.id}\"]').find('.btn-add-to-cart').click()")
  sleep 0.5
end

sleep 2
#add_buttons.click

# Quit
@browser.quit
