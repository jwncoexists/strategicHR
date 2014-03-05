Feature: user course certificate page

  As a user who has purchased a certificate, then I can view, print and email the certificate

   Background:
    Given a member user named "member-user"
    And a course named "5 Trends"
    And a Quiz named "5 Trends Quiz"
    And two questions for the Quiz named "5 Trends Quiz"
    And two answers for each of the the questions for the quiz name "5 Trends Quiz"
    And a section for the course "5 Trends" with the quiz "5 Trends Quiz"
    And a successful quiz attempt for the course "5 Trends" and the quiz "5 Trends Quiz"
    And I have purchased a certificate for the course named "5 Trends"
    And I log in as member user named "member-user"

  Scenario: I can view my purchased certificate
    When I visit the "5 Trends" course page
    And I click on the "View Certificate" link
    Then I can view my "5 Trends" course certificate
    