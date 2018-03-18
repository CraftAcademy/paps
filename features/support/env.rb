require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version '2.36'

# Capybara.register_driver :selenium do |app|
#   options = Selenium::WebDriver::Chrome::Options.new(
#       implicit_wait: 60,
#       args: %w( disable-popup-blocking disable-infobars)
#   )
#
#   Capybara::Selenium::Driver.new(
#       app,
#       browser: :chrome,
#       options: options
#   )
# end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 90 # instead of the default 60
  Capybara::Selenium::Driver.new(app, browser: :chrome, profile: profile, http_client: client)
end
Capybara.javascript_driver = :selenium
