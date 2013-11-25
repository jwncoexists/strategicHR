Feature: my account page

  As a registered user, I can see the my account page and can update my account

  Scenario:
    Given I am a user
    When I go to my account page
    Then I see information about my account

  Scenario:
    Given I am a user
    When I go to my account page
    And I click on the "Change Password" link
    Then I am prompted with a form to change my password

  Scenario:
    Given I am a user
    When I go to my account page
    And I click on the "Change Email Address" link
    Then I am prompted with a form to change my email address

  Scenario:
    Given I am a user
    When I go to my account page
    And I click on the "Change Profile" link
    Then I am prompted with a form to update my profile