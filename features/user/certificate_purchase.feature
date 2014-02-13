Feature: purchase certificates for completed courses

  As a registered user, I can purchase certificates for completed courses

  Background:
    Given a member user named "member user"
    And a course named "5 Trends"
    And a Quiz named "5 Trends Quiz"
    And two questions for the Quiz named "5 Trends Quiz"
    And two answers for each of the the questions for the quiz name "5 Trends Quiz"
    And a section for the course "5 Trends" with the quiz "5 Trends Quiz"
    And a successful quiz attempt for the course "5 Trends" and the quiz "5 Trends Quiz"
    And I log in as member user named "member user"

  Scenario:
    When I go to the Courses page
    Then I see a link to purchase a certificate for the course named "5 Trends"

  Scenario:
    When I go to the Courses page
    And I click on a link to purchase a certificate for the course named "5 Trends"
    Then I am prompted for information to purchase the certificate