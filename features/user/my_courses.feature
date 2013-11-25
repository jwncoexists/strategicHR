Feature: my courses page

  As a registered user, I can see the My Courses page and can go to the "5 Trends Shaping the Future of Work Course"

  Scenario:
    Given I am a user
    When I go to my courses page
    Then I see a dashboard of all my courses 

  Scenario:
    Given I am a user
    When I go to my courses page
    And I click on the link to the "5 Trends Shaping the Future of Work" course
    Then I go to the course page for "5 Trends Shaping the Future of Work"
