### Ruby-selenium-cucumber-siteprism

selenium-cucumber : Automation Tesing Using Ruby

selenium-cucumber is a behavior driven development (BDD) approach to write automation test script to test Web.It is cross-platform, open source and free.

A Page Object Model DSL for Capybara

SitePrism gives you a simple, clean and semantic DSL for describing your site using the Page Object Model pattern, for use with Capybara in automated acceptance testing.

Find the pretty documentation here: http://rdoc.info/gems/site_prism/frames

Make sure to add your project/company to https://github.com/site-prism/site_prism/wiki/Who-is-using-SitePrism

### Environment Setup
1. Global Dependencies
    * Mac 
        - Install Chrome or Mozila
        - Install homebrew
        - Install ChromeDriver (brew install chromedriver)
        - Install GeckoDriver (brew install geckodriver)
        - Install ruby (brew install ruby)
2. Project Dependencies
        - Install bundler (gem install bundler)
        - Install the gems (bundle install)

### Running Tests
1.  Running everything
    - Navigate to the base directory
    - Run cucumber (cucumber)
2. Running a specific feature
    - Navigate to the base directory
    - Run cucumber with parameters cucumber features/example.feature

### Example
1. Gerhkin File
   ```
    Feature: Product Tiket
        Scenario: Book Product hotel
            Given I navigate to login page and login with facebook
            When I try to book hotel for 32 guest and 8 room
            Then I should transaction created and price correct
    ```
2. Pages
    class Login < SitePrism::Page
        set_url '/login'
  
        element :button_login_fb, :xpath, '(//*[@class="btn-list"]//li)[3]'
        element :field_name_fb, 'input[id="email"]'
        element :field_password_fb, 'input[id="pass"]'
    end
3. Step_defintions
     ```
    Given('I navigate to login page and login with email') do
        account = File.read("features/testdata/user_acoount.json")
        obj = JSON.parse(account)
        @test_site.login.load
        @test_site.login.login_with_gmail(obj["account_gmail"]["email"], obj["account_gmail"]["password"])
    end
    ``` 
4. Test Data 
    ```
    {
        "account_gmail": {
        "email": "email",
        "password": "password"
        }
    }
    ```

    - Call test data
    ```
        require "json"
        account = File.read("features/testdata/user_acoount.json")
        obj = JSON.parse(account)
    ```   
