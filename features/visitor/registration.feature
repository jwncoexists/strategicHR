Feature: registration page

  As a visitor, I can see the user registration page.

  Scenario:
    Given I am a visitor
    When I go to the registration page
    Then I see a form asking to enter my information to become a registered user

  Scenario:
    Given I am a visitor
    When I go to the registration page
    When I enter required registration information
    And I click the Submit button
    Then I am directed to the login screen with a notice to confirm my email address