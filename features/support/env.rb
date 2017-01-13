require "capybara/cucumber"
require "selenium-webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Capybara.register_driver :selenium_firefox do |app|
#   Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
# end

Capybara.javascript_driver = :chrome
#Capybara.javascript_driver = :selenium_firefox

Selenium::WebDriver::Chrome.driver_path = 'features/support/chromedriver/chromedriver.exe'
#Selenium::WebDriver::Chrome.driver_path = 'features/support/chromedriver/chromedriver'
Selenium::WebDriver::Firefox.driver_path = 'features/support/geckodriver/geckodriver.exe'

Capybara.default_driver = :chrome
#Capybara.default_driver = :selenium_firefox
Capybara.default_max_wait_time = 15

#arquivo com dados de acesso
$acesso = 'features/support/acesso'
