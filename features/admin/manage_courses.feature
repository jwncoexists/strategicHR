Feature: admin manage courses page

  In order to create and manage courses on the strategichr website,
  As an administrative user, I can add, update and delete courses on the admin manage courses page.

  Background:
    Given an administrative user named "Test Admin User"
    And I log in as "Test Admin User"
    And I visit the Manage Courses home page

  Scenario: I can add a new course
    Then I can create a new course named "Strategic HR Overview"

  Scenario: I can change an existing course
    Given a course named "Strategic HR Overview"
    When I edit the course named "Strategic HR Overview" course
    And change its name to "Strategic HR Summary"
    Then the name of the course is stored

  Scenario: I can delete a course
    Given a course I want to delete named "Strategic HR Summary"
    When I view the "Strategic HR Summary" course
    Then I can delete the course
