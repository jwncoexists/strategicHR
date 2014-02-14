Feature: my account page

  As a registered user, I can see the my account page and can update my account

  Background:
    Given a member user named "member user"
    And I log in as member user named "member user"
    And I visit My Account page

  Scenario:
    Then I see information about my account

  Scenario:
    When I click on the "Edit User Info" link
    Then I am prompted with a form to update my profile

