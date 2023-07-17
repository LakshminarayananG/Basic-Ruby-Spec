require "selenium-webdriver"
require "test/unit"

class SeleniumRubyTest < Test::Unit::TestCase
@@driver

def setup
# create Driver object for Chrome
@@driver = Selenium::WebDriver.for :chrome
# Navigate to URL
@@driver.navigate.to "https://www.google.com/"
sleep 15
end

def test_login
@@driver.find_element(:name => "q").send_keys "Sample"
@@driver.save_screenshot("sample.png")
end

def teardown
# Quit the driver
@@driver.quit
end

end