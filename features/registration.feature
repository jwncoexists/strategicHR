registration page

  As a visitor 
  I can see the registration page.

  Scenario:
    Given I am a visitor
    When I go to the registration page
    I see introductory text describing what I am entitled to as a registered user.
    I see introductory text describing that it does not cost anything to register.
    I see a prompt to enter my name as a required field.
    I see a prompt to enter my company as an optional field.
    I see a prompt to enter my title as an optional field.
    I see a promopt to enter my phone number as an optional field
    I see a prompt to enter my email address as a required field
    I see a prompt to enter my password as a required field
    I see a prompt to confirm my password as a required field
    I see a button to submit my registration
    I see a button to cancel my registration

    After clicking the submit button, my user information is saved
    If registration is sucessful, I am routed to My Courses page with a message that my registration was successful.
    If registration is not successful, I am re-routed to the registration page.
    If I cancel the registration process, I am routed to the home page.