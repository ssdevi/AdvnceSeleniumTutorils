require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
#require 'gmail'
$driver = Selenium::WebDriver.for :firefox
Before do
  driver = $driver
  $driver.get("http://www.petsmart.com/")
 end

After do
  $driver.close
  $driver.quit
  sleep 5
end