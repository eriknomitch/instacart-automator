require 'rubygems'
require 'selenium-webdriver'

load 'utility.rb'
load 'attribute_initializable.rb'
load 'cart.rb'
load 'item.rb'

Item.define 42557, 3
Item.define 34180, 1
Item.define 40082, 1

# Initialize browser
puts "Initializing browser..."
@@browser = Selenium::WebDriver.for :firefox

puts "Fetching Login page..."
@@browser.get "http://instacart.com/accounts/login"

# Fill in the Login form
puts "Filling in Login form..."
fill_input_with "user_email",    "enomitch@gmail.com"
fill_input_with "user_password", "changeme123"

# Login
puts "Logging in..."
@@browser.find_element(:name => "commit").click

puts "Waiting for Store page to load..."
sleep 5

# Clear cart
puts "Clearing cart..."
Cart.clear

# Add items
puts "Adding items..."

Item.add_items

sleep 1

Cart.place_order

# Quit
@@browser.quit
