Feature: user course certificate page

  As a user who has purchased a certificate, then I can view, print and email the certificate

  Scenario: I can view my purchased certificate
    Given I have purchased a certificate for "5 Trends Shaping the Future of Work"
    When I log in as a user
    And I visit my certificates page
    Then I can view my "5 Trends Shaping the Future of Work" certificate

  Scenario: I can print my purchased certificate
    Given I have purchased a certificate for "5 Trends Shaping the Future of Work"
    When I log in as a user
    And I visit my certificates page
    Then I can print my "5 Trends Shaping the Future of Work" certificate

   Scenario: I can email my purchased certificate
    Given I have purchased a certificate for "5 Trends Shaping the Future of Work"
    When I log in as a user
    And I visit  my certificates page
    Then I can email my "5 Trends Shaping the Future of Work" certificate