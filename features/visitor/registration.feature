Feature: registration page

  As a visitor, I can see become a registered user.

  Scenario:
    Given I am a visitor to the registration page
    When I enter required registration information
    And I click the Register button
    Then I am directed to the login screen with a notice to confirm my email address
