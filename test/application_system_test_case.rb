require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :remote_browser, using: :remote, screen_size: [1400, 1400]

  def setup
    Capybara.app_host = "http://rails_demo:4000"
    Capybara.server_port = 4000
    Capybara.server_host = "0.0.0.0"

    Capybara.register_driver :remote_browser do |app|
      url = 'http://selenium-hub:4444'
      options = Selenium::WebDriver::Options.chrome
      Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: options)
    end

    Capybara.default_driver = :remote_browser
    Capybara.javascript_driver = :remote_browser
    super
  end
end
