Feature: sign-out page

  As a registered user, I can see the sign-out page.

  Scenario:
    Given I am a user
    When I go to the sign-in page
    And I enter my user name and password
    And click the sign-out link
    Then I see confirmation that I have signed out of StrategicHR