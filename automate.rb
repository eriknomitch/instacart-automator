require 'rubygems'
require 'selenium-webdriver'

load 'utility.rb'
 
# Initialize browser
@browser = Selenium::WebDriver.for :firefox
@browser.get "http://instacart.com/accounts/login"

# Fill in the Login form
fill_input_with "user_email",    "enomitch@gmail.com"
fill_input_with "user_password", "automator1"

# Sign in
@browser.find_element(:name => "commit").click

# Quit
@browser.quit
