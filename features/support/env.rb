require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'site_prism'
require 'dotenv'

Dotenv.load

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', "#{ENV['BS_BROWSER']}").to_sym
  Capybara::Selenium::Driver.new(app, browser: browser)
end

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
  config.default_max_wait_time = 20
  config.app_host = "#{ENV['APP_HOST']}"
  config.ignore_hidden_elements = false
end