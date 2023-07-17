require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require "test/unit"
require 'rspec-steps'

describe "Sample web test" do

	before(:each) do
    caps = Selenium::WebDriver::Remote::Capabilities.firefox(
	:platformName          => "linux",
	)
	@driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:4444/wd/hub", :capabilities => caps)
	@driver.manage.timeouts.implicit_wait = 30 # seconds
  	end

	after(:each) do
		@driver.quit
	end

	it "Launch salesforce Login Page" do 

			#Login to leaftaps application
			@driver.navigate.to "http://login.salesforce.com"
			wait = Selenium::WebDriver::Wait.new(:timeout => 40)
			sleep 10
			@driver.find_element(:id => "username").send_keys "laksvijay07@gmail.com"
			@driver.find_element(:id => "password").send_keys "test@123"
			@driver.find_element(:id => "Login").click
		

			#Click on the switcher and navigate to accounts section
			@driver.find_element(:class => "slds-icon-waffle").click
			@driver.find_element(:xpath => "//p[text()='Service']").click

			wait.until { @driver.find_element(:xpath => "//span[text()='Accounts']") }
			element = @driver.find_element(:xpath => "//span[text()='Accounts']")
			@driver.execute_script("arguments[0].click();", element)
			

			#Click on new and create a new account
			@driver.find_element(:xpath => "//div[@title='New']").click
			acc_name = Faker::Name.unique.name
			puts acc_name
			@driver.find_element(:xpath => "//input[(@class='slds-input') and @name='Name']").send_keys acc_name

			sleep 5
	end
end