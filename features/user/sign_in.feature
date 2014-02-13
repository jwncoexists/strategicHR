Feature: sign-in page

  As a User, I can sign-in to Strategic HR.

  Scenario:
    Given I am a visitor
    When I go to the sign-in page
    Then I see a form asking me for information to sign in to StrategicHR

  Scenario:
    Given I am a user
    When I go to the sign-in page
    And I enter my user name and password
    Then I see My Courses page
    And I do not see Admin functions
