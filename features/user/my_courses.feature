Feature: my courses page

  As a registered user, I can see the Courses page, I can go to the "5 Trends Shaping the Future of Work Course", and I can see the status of that course.

  Background:
    Given a member user named "member user"
    And a course named "5 Trends"
    And I log in as member user named "member user"
    And I visit the Courses page

  Scenario:
    Then I see a list all my courses 

  Scenario:
    When I click on the link to the "5 Trends" course
    Then I see the course page for "5 Trends"
