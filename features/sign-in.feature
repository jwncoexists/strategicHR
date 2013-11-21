sign-in page

  As a visitor 
  I can see the sign-in page.

  Scenario:
    Given I am a visitor
    When I go to the sign-in page
    I see a prompt to enter my email address as a required field
    I see a prompt to enter my password as a required field
    I see a link to click if I forgot my password
    I see a button to sign in
    I see a button to cancel my sign in
    After clicking the sign-in button, I see a prompt indicating whether or not my sign-in was successful
    After a successful sign-in, I am routed to My Courses page.
    If sign-in is not successful, I am routed back to the sign-in page