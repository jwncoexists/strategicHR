Feature: admin manage quizzes page

  In order to create and manage quizzes,
  As an administrative user, I can add, update and delete quizzes.

  Background:
    Given a quizzes administrative user named "Test Admin User"
    And I log in as the quizzes "Test Admin User"
    And I visit the Quizzes page

  Scenario: I can add a new quiz
    Then I can create a new quiz named "Strategic HR Overview"

  Scenario: I can change an existing quiz name
    Given a quiz named "Strategic HR Overview"
    When I edit the quiz named "Strategic HR Overview"
    And change the quiz name to "Strategic HR Summary"
    Then the name of the quiz is stored
  
  Scenario: I can add a new quiz question
    Given a quiz "Strategic HR Summary"
    When I edit the quiz named "Strategic HR Summary"
    And add a question, "What type of shortage do workplaces face today?"
    Then the question is added to the quiz

  Scenario: I can delete an existing quiz question
    Given a quiz "Strategic HR Summary"
    And a question, "What type of shortage do workplaces face today?"
    When I edit the "Strategic HR Summary" quiz
    And delete the question "What type of shortage do workplaces face today?"
    Then the question is removed from the quiz

  Scenario: I can delete a quiz
    Given a quiz "Strategic HR Summary"
    Then I can delete the quiz
