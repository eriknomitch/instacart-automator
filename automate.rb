require 'rubygems'
require 'selenium-webdriver'
 
def fill_input_with(id, value)
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)

  input = wait.until {
      element = @browser.find_element(:id, id)
      element if element.displayed?
  }
  input.send_keys(value)
end

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
