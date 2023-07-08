require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

describe "Sample web test" do

	before(:each) do
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
	:platformName          => "linux",
	)
	@driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:4444/wd/hub", :capabilities => caps)
  	end

	after(:each) do
		@driver.quit
	end

	it "Launch Google home page" do 
		@driver.navigate.to "https://www.amazon.com"
		sleep 45	
	end
end