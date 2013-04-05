require 'rubygems'
require 'selenium-webdriver'
require 'watir'
require 'watir-webdriver'
require 'pry'

load 'utility.rb'
load 'attribute_initializable.rb'
load 'cart.rb'
load 'item.rb'

Item.define 42557, 3
Item.define 34180, 1
Item.define 40082, 1

TARGET_URL_PREFIX="http://instacart.com"

# Initialize browser
puts "Initializing browser..."
@@browser = Watir::Browser.new

# Fetch Login page..."
puts "Fetching Login page..."
@@browser.goto "#{TARGET_URL_PREFIX}/accounts/login"

# Fill in the Login form
puts "Filling in Login form..."
@@browser.text_field(:name => "user[email]").set    "enomitch@gmail.com"
@@browser.text_field(:name => "user[password]").set "changeme123"

@@browser.form(:id => "new_user").submit

# Clear cart
puts "Clearing cart..."
Cart.clear

# Add items
puts "Adding items..."

Item.add_items

puts "Placing order..."
Cart.place_order

sleep 5

# Quit
puts "Quitting browser..."
@@browser.quit

