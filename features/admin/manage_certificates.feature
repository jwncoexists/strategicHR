Feature: admin manage certificates page

  In order to create and manage certificates for courses,
  As an administrative user, I can add, update and delete certificates.

  Scenario: I can add a new certificate
    When I log in as an administrative user
    And I visit the admin manage certificates page
    Then I can create a new certificate named "Strategic HR Overview"

  Scenario: I can change an existing certificate
    Given a certificate "Strategic HR Overview"
    When I log in as an administrative user
    When I edit the "Strategic HR Overview" certificate
    And change its name to "Strategic HR Summary"
    Then the name of the certificate is stored

  Scenario: I can delete a certificate
    Given a certificate "Strategic HR Summary"
    When I log in as an administrative user
    And I edit the "Strategic HR Summary" certificate
    Then I can delete the certificate
