Feature: my certificates page

  As a registered user, I can see the my certificates page

  Scenario:
    Given I am a user
    When I go to my certificates page
    Then I see information about all of the certificates I have ordered, and certificates that are available to order

  Scenario:
    Given I am a user
    When I go to my certificates page
    And I click on a link to purchase a certificate for a completed class named "5 Trends Shaping the Future of Work"
    Then I am prompted to enter my credit card information for purchasing the certificate
