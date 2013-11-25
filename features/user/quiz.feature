Feature: quiz page

  As a user, I can see the quiz page for a course

  Scenario:
    Given I am a user
    When I go to the quiz page for a course
    Then I see my status for the quiz and links to start or resume the quiz

  Scenario:
    Given I am a user
    When I go to the quiz page for "5 Trends Shaping the Future of Work"
    And I click on the link to start the "5 Trends Shaping the Future of Work" quiz
    Then I see the first question for the quiz
