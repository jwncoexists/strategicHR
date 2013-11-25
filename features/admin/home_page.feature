Feature: admin login to home page

  As an administrative user I can login to the admin home page
  
  Scenario: An admin to login to the Admin home page
    When I log in as an administrative user
    And I visit the admin home page
    Then I can see links to administrative functions
