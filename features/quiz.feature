quiz page

  As a user
  I can see the quiz page for a course

  Scenario:
    Given I am a user
    When I go to the quiz page for a course
    I see the title of the Course/Quiz
    I see my status for the quiz indicating "Not Yet Available" "Not Started", "Quiz in progress", "Quiz Retake Required" "Quiz Passed with x% correct"
    If I have completed the quiz, I see a link to review my quiz results
    If I have not completed the quiz, I see a link to either start or resume the quiz
    If I have passed the quiz, I see a link to Order a certificate.

    If I click start or resume, I see a question randomly selected from the set of questions with multiple choice answers (which does not repeat previous questions I've answered)
    I see an input prompt  to answer the question
    If I answer the question incorrectly, I get immediate feedback on the correct answer
    While taking the quiz, I can cancel taking the quiz
    While taking the quiz, I can restart the quiz
    While taking the quiz, I can play the video
    When the quiz is complete, I see my % correct and whether or not I've passed the quiz.
    If I don't pass the quiz, I get a message that I can retake the quiz to qualify the the certificate and CEU credits.

