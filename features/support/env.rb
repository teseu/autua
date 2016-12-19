require "capybara/cucumber"
require "selenium-webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome

Selenium::WebDriver::Chrome.driver_path = 'features/support/chromedriver/chromedriver.exe'

Capybara.default_driver = :chrome
Capybara.default_max_wait_time = 60
