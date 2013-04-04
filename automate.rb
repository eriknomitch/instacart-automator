require 'rubygems'
require 'selenium-webdriver'
 
@browser = Selenium::WebDriver.for :firefox
@browser.get "http://instacart.com/accounts/login"
 
def fill_input_with(id, value)
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)

  input = wait.until {
      element = @browser.find_element(:id, "user_email")
      element if element.displayed?
  }
  input.send_keys("enomitch@gmail.com")
end

fill_input_with "user_email",    "enomitch@gmail.com"
fill_input_with "user_password", "automator1"
 
# Find text on the page by regexp
#puts "Test Passed: Page 1 Validated" if wait.until {
    #/Testing Web Applications with Ruby and Selenium WebDriver/.match(browser.page_source)
#}
 
browser.quit
