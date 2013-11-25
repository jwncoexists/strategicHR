Feature: sign-out page

  As a registered user, I can see the sign-out page.

  Scenario:
    Given I am a user
    When I go to the sign-out page
    Then I see confirmation that I have signed out of StrategicHR