Feature: contact Dr. Bob page

  As a visitor, I can contact Dr. Bob

  Scenario: I can contact Dr. Bob
    Given I am a visitor
    When I go to the contact Dr. Bob page
    Then I can send a message to Dr. Bob
