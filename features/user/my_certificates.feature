Feature: my certificates page

  As a registered user, I can view all of my purchased certificates

  Scenario:
    Given I am a user
    When I go to my certificates page
    Then I see all of my purchased certificates
