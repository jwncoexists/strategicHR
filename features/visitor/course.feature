Feature: course page

  As a visitor, I can see the page for the "Visitor Course" course

  Scenario:
    Given I am a visitor to the course page for "Visitor Course"
    Then I see visitor information about the course
    And I am prompted to either login or sign up