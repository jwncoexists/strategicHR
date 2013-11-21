contact page

  As a visitor 
  I can see the contact page.

  Scenario:
    Given I am a visitor
    When I go to the contact page
    I see a form to enter my inquiry
    I see a prompt with my name
    I see a prompt with my email address
    I see a prompt for a subject
    I see a prompt for a message
    I see a send button
    I see Dr. Bob's email address
    I see Dr. Bob's phone number
    After pressing the send button, if I am a visitor, I am routed to the home page
    After pressing the send button, If I am a user, I am routed to My Courses page