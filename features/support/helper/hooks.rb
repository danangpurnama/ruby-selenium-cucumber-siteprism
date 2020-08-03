Before do
    @test_site = TestSite.new
    page.driver.browser.manage.window.resize_to(1200, 800)
    require "json"
end

Before('@slow-test') do
    Capybara.default_max_wait_time = 0.1
end
  
After('@slow-test') do
    Capybara.default_max_wait_time = 0.75
end
