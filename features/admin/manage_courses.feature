Feature: admin manage courses page

  In order to create and manage courses on the strategichr website,
  As an administrative user, I can add, update and delete courses on the admin manage courses page.

  Scenario: I can add a new course
    When I log in as an administrative user
    And I visit the admin manage courses page
    Then I can create a new course named "Strategic HR Overview"

  Scenario: I can change an existing course
    Given a course "Strategic HR Overview"
    When I log in as an administrative user
    When I edit the "Strategic HR Overview" course
    And change its name to "Strategic HR Summary"
    Then the name of the course is stored

  Scenario: I can delete a course
    Given a course "Strategic HR Summary"
    When I log in as an administrative user
    And I edit the "Strategic HR Summary" course
    Then I can delete the course
