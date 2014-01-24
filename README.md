strategicHR
===========
StrategicHR is an elearning environment where visitors browse and search for courses, and registered users can take courses and receive certification. Each course consists of a video and a quiz.  After watching the complete video, and passing the quiz, users can optionally pay to receive a certificate for passing the course.  

The videos are posted to a youtube account, and users must watch the entire video, and pass the quiz, in order to pass the course.

The quizzes are graded as pass/fail only.  Every question on a quiz is a multiple-choice question.  Each quiz might consist of 25 total questions, but users are only asked to answer a random subset of those 25 questions each time they take the quiz.  The default passing score is 80% correct, but this percentage can be customized per quiz. Quizzes can be taken by users as many times as desired.

The videos and quizzes are free, but users must register in order to be able to watch a video and take a quiz.  Once a user has watched the entire video, and passed the quiz, then they have successfully completed the course.  After completing a course, if the user wants a certificate for the class (which typically qualifies them for some type of continuing education credit), then they will pay a processing fee.  The default processing fee is $39.99.

Users who are not registered can browse all of the courses, but they cannot watch the videos or take the quizzes.   Registered Users can see the status of their courses, including:  which courses they’ve completed, which they haven’t, and which ones they’ve received certificates for.


* Ruby version 2.0, Rails Version 4

* System dependencies

Stripe, YouTube, Bootstrap, email

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

Deployment
-----

<b>Configure Email:</b>

Emails are sent to new users when they register in order to confirm their
email address.  Do the following to setup email:

1.  Copy the "config/application.example.yml" file, and remove "example" from the name.

2.  Specify your production and development email configurations in this file. Your application.yml should contain your sensitive credentials. It should be included in .gitIgnore as well.

<b>Establish a Stripe Account:</b>


```











