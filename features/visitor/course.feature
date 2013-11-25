Feature: course page

  As a visitor, I can see the page for the "5 Trends Shaping the Future of Work" course

  Scenario:
    Given I am a visitor
    When I go to the course page for "5 Trends Shaping the Future of Work"
    Then I see information about the course.

  Scenario:
    Given I am a visitor
    When I go to the course page for "5 Trends Shaping the Future of Work"
    And I click on the link to take the course
    Then I am prompted to either sign-in or register