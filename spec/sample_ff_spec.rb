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

	it "Login to Leaftaps Application" do
			@driver.navigate.to "http://login.salesforce.com"
			sleep 30
			@driver.find_element(:id => "username").send_keys "laksvijay@gmail.com"
			@driver.find_element(:id => "password").send_keys "test@123"
			@driver.find_element(:id => "Login").click
		sleep 5
	end
end