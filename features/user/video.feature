Feature: video page

  As a registered user, I can see the video page for a course

  Background:
    Given a member user named "member-user"
    And a course named "5 Trends"
    And a video named "5 Trends Video"
    And the video "5 Trends Video" is assigned to course "5 Trends"
    And I log in as member user named "member-user"
    And I visit the "5 Trends" course page

  Scenario:
    When I go to the video page for "5 Trends Video"
    Then I see a link to view the "5 Trends Video" video
