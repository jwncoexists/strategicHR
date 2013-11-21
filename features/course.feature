course page

  As a user
  I can see the course page

  Scenario:
    Given I am a user
    When I go to the course page
    I see the title of the Course
    I see a description of the Course
    I see my course status indicating "Not Started", "Video training in progress", "Quiz in progress", "Quiz Retake Required" "Course Completed" "Course Completed & Certificate Ordered"
    I see a link to watch/resume the video
    If I have completed the video, I see a link to take/resume the quiz.
    If I passed the quiz, and have not purchased a certificate, I see a link to Order a certificate.
    If I passed the quiz, and have purchased a certificate, I see a link to view the certificate.
    I see a link to email Dr. Bob a question regarding the class