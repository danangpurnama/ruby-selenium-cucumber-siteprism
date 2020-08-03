Feature: Product Tiket
    Scenario: Book Product hotel
        Given I navigate to login page and login with facebook
        When I try to book hotel for 32 guest and 8 room
        Then I should transaction created and price correct

# Scenario: Book Product flight
#     Given I navigate to login page and login with email
#     When I try to create transaction domestic round trip with 2 transit
#     And I pay using virtual account
#     Then I should transaction flight created and price correct
