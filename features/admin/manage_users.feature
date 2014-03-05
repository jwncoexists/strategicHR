Feature: admin manage users page

  In order to create and manage users on the strategichr website,
  As an administrative user, I can add, update, delete, export, and email users.

  Scenario: I can add a new users
    When I log in as an administrative user
    And I visit the admin manage users page
    Then I can create a new user named "John Doe"

  Scenario: I can change an existing user
    Given a user "John-Doe"
    When I log in as an administrative user
    When I edit "John-Doe" user
    And change his name to "Jane-Doe"
    Then the name of the user is stored

  Scenario: I can delete a user
    Given a user "Jane-Doe"
    When I log in as an administrative user
    And I edit the "Jane-Doe" user
    Then I can delete the user

  Scenario: I can export the user list
    When I log in as an administrative user
    And I visit the manage users page
    Then I can export the user list to a tab delimited text file

  Scenario: I can send an email to the userlist
    When I log in as an administrative user
    And I visit the manage users page
    Then I can send an email to the user list

  Scenario: I can view emails sent to the user list
    When I log in as an administrative user
    And I visit the manage users page
    Then I can view emails which have been sent to the user list
