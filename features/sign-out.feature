sign-out page

  As a user
  I can see the sign-out page.

  Scenario:
    Given I am a user
    When I go to the sign-out page
    I see a prompt to confirm signing out
    I see a button to sign out
    I see a button to cancel my sign out
    After clicking the sign-out button
    After a successful sign-out, I am routed to home page.