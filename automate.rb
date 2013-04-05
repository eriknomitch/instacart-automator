require 'rubygems'
require 'selenium-webdriver'
require 'watir'
require 'watir-webdriver'

load 'utility.rb'
load 'attribute_initializable.rb'
load 'cart.rb'
load 'item.rb'

Item.define 42557, 3
Item.define 34180, 1
Item.define 40082, 1

# Initialize browser
puts "Initializing browser..."
@@browser = Watir::Browser.new

# Fetch Login page..."
puts "Fetching Login page..."
@@browser.goto "http://instacart.com/accounts/login"

# Fill in the Login form
puts "Filling in Login form..."
@@browser.text_field(:name => "user[email]").set "enomitch@gmail.com"
@@browser.text_field(:name => "user[password]").set "changeme123"

@@browser.form(:id => "new_user").submit

sleep 2

# Quit
puts "Quitting browser..."
@@browser.quit

## Login
#puts "Logging in..."
#@@browser.find_element(:name => "commit").click

#puts "Waiting for Store page to load..."
#sleep 5

## Clear cart
#puts "Clearing cart..."
#Cart.clear

#sleep 3

## Add items
#puts "Adding items..."

#Item.add_items

#sleep 2

#puts "Placing order..."
#Cart.place_order

## Quit
#@@browser.quit
