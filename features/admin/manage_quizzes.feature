Feature: admin manage quizzes page

  In order to create and manage quizzes,
  As an administrative user, I can add, update and delete quizzes.

  Scenario: I can add a new quiz
    When I log in as an administrative user
    And I visit the admin quiz page
    Then I can create a new quiz named "Strategic HR Overview"

  Scenario: I can change an existing quiz name
    Given a quiz "Strategic HR Overview"
    When I log in as an administrative user
    When I edit the "Strategic HR Overview" quiz
    And change its name to "Strategic HR Summary"
    Then the name of the quiz is stored
  
  Scenario: I can add a new quiz question
    Given a quiz "Strategic HR Summary"
    And a question, "What type of shortage do workplaces face today?"
    When I log in as an administrative user
    When I edit the "Strategic HR Summary" quiz
    And add the question "What type of shortage do workplaces face today?"
    Then the question is added to the quiz

  Scenario: I can delete an existing quiz question
    Given a quiz "Strategic HR Summary"
    And a question, "What type of shortage do workplaces face today?"
    When I log in as an administrative user
    When I edit the "Strategic HR Summary" quiz
    And delete the question "What type of shortage do workplaces face today?"
    Then the question is removed from the quiz

  Scenario: I can delete a quiz
    Given a quiz "Strategic HR Summary"
    When I log in as an administrative user
    And I edit the "Strategic HR Summary" quiz
    Then I can delete the quiz
