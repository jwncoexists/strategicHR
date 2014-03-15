Feature: my course status

  As a user, I can see the status of my courses

  Background:
    Given a member user named "member-user"
    And a course named "5 Trends"
    And a video named "5 Trends Video"
    And a second video named "5 Trends Video 2"
    And a Quiz named "5 Trends Quiz"
    And a second Quiz named "5 Trends Quiz 2"
    And two questions for the Quiz named "5 Trends Quiz"
    And two questions for the second Quiz named "5 Trends Quiz 2"
    And two answers for each of the the questions for the quiz name "5 Trends Quiz"
    And two answers for each of the the questions for the second quiz name "5 Trends Quiz 2"
    And a section for the course "5 Trends" with the quiz "5 Trends Quiz"
    And a second section for the course "5 Trends" with the quiz "5 Trends Quiz 2"
    And I log in as member user named "member-user"
    And I visit the "5 Trends" course page

  Scenario:
    When I visit the Courses Page
    Then I see that I have not started the course

  Scenario:
    When I go to the quiz page for "5 Trends Quiz"
    And I click on the link to start the quiz named "5 Trends Quiz"
    And I answer incorrectly some the questions for the quiz named "5 Trends Quiz"
    When I visit the Courses Page
    Then I see that the course is in progress

  Scenario:
    When I go to the quiz page for "5 Trends Quiz"
    And I click on the link to start the quiz named "5 Trends Quiz"
    And I answer correctly all the questions for the quiz named "5 Trends Quiz"
    And I visit the "5 Trends" course page
    And I go to the quiz page for "5 Trends Quiz 2"
    And I click on the link to start the quiz named "5 Trends Quiz 2"
    And I answer correctly all the questions for the quiz named "5 Trends Quiz 2"
    When I visit the Courses Page
    Then I see that the status of the course named "5 Trends" is complete