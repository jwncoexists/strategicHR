Feature: admin manage videos page

  In order to add and manage videos,
  As an administrative user, I can add, update and delete videos on the admin manage videos page.

  Scenario: I can add a new video
    When I log in as an administrative user
    And I visit the admin video page
    Then I can add a new video named "Strategic HR Summary"

  Scenario: I can change an existing video
    Given a video "Strategic HR Summary"
    When I log in as an administrative user
    When I edit the "Strategic HR Summary" video
    And change its name to "Strategic HR Overview"
    Then the name of the video is stored

  Scenario: I can delete a video
    Given a video "Strategic HR Overview"
    When I log in as an administrative user
    And I edit the "Strategic HR Overview" video
    Then I can delete the video
