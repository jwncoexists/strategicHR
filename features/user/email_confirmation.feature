Feature: email_confirmation page

  As a registered user, I can confirm my email address by going to the email_confirmation page.

  Scenario:
    Given I am a user
    When I go to the email confirmation page
    Then I see a confirmation that I my registration with strategicHR is complete