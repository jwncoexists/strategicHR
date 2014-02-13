Feature: quiz page

  As a user, I can see the quiz page for a course

  Background:
    Given a member user named "member user"
    And a course named "5 Trends"
    And quiz named "5 Trends Quiz"
    And the quiz "5 Trends Quiz" is assigned to course "5 Trends"
    And I log in as member user named "member user"
    And I visit the "5 Trends" course page

  Scenario:
    When I go to the quiz page for "5 Trends Quiz"
    Then I see my status for the quiz and links to start or resume the quiz

  Scenario:
    When I go to the quiz page for "5 Trends Quiz"
    And I click on the link to start the "5 Trends Shaping the Future of Work" quiz
    Then I see the first question for the quiz
