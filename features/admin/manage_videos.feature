Feature: admin manage videos page

  In order to add and manage videos,
  As an administrative user, I can add, update and delete videos.

  Background:
    Given a videos administrative user named "Test-Admin-User"
    And I log in as the videos "Test Admin User"
    And I visit the Videos page

  Scenario: I can add a new video
    Then I can add a new video named "Strategic HR Summary"

  Scenario: I can change an existing video
    Given a video named "Strategic HR Overview"
    When I edit the the "Strategic HR Overview" video
    And change its url to "http://www.youtube.com"
    Then the url of the video is stored

  Scenario: I can delete a video
    Given a video named "Strategic HR Overview"
    When I view the "Strategic HR Overview" video
    Then I can delete the video
