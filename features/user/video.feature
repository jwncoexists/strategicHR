Feature: video page

  As a user, I can see the video page for a course

  Scenario:
    Given I am a user
    When I go to the video page for "5 Trends Shaping the Future of Work"
    Then I see a link to view the "5 Trends Shaping the Future of Work" video

  Scenario:
    Given I am a user
    When I go to the video page for "5 Trends Shaping the Future of Work"
    And I click on the link to start the "5 Trends Shaping the Future of Work" video
    Then the video starts playing