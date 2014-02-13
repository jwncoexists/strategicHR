Feature: email_confirmation page

  As a registered user, I can confirm my email address by going to the email_confirmation page.

  Background:
    Given I am a visitor to the registration page
    And I enter required registration information
    And I click the Register button
  
  Scenario:
    When I go to the email confirmation page
    Then I see a confirmation that my registration with strategicHR is complete