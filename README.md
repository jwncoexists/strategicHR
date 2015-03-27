StrategicHR Overview
====================
StrategicHR is an elearning environment where visitors browse and search for courses, and registered users can take courses and receive certification. Each course consists of a video, a handout, and a quiz.  After watching a video, and passing the quiz, users can optionally pay to receive a certificate, and earn credit, for passing the course.  

The videos are posted to a youtube account, and users must watch the entire video, and pass the quiz, in order to pass the course.

The quizzes are graded as pass/fail only.  Every question on a quiz is a multiple-choice question.  Each quiz might consist of 25 total questions, but users are only asked to answer a random subset of those 25 questions each time they take the quiz.  The default passing score is 80% correct, but this percentage can be customized per quiz. Quizzes can be taken by users as many times as desired.

The videos, handouts, quizzes are free, but users must register in order to be able to watch a video, look at a handout, and take a quiz.  Once a user has passed the quiz, then they have successfully completed the course.  After completing a course, if the user wants a certificate for the class (which typically qualifies them for some type of continuing education credit), then they will pay a processing fee.  The default processing fee is $39.99, but this is customizeable per course.   Registered Users can see the status of their courses, including:  which courses they’ve completed, which they haven’t, and which ones they’ve received certificates for.

Users who are not registered can browse all of the courses, but they cannot watch the videos, view the handouts, or take the quizzes.  


* System dependencies
---

Ruby version 2.0, Rails Version 4
Redis, PostgreSQL, Resque, Stripe, Vimeo, Bootstrap, email account


* Installation
---
1.  Install Rails 4.0 and Ruby 2.0
2.  Install Cucumber using instructions from https://github.com/cucumber/cucumber-rails/blob/master/README.md
3.  Install Redis (brew install redis)
4.  Get the StrategicHR code from GitHub
5.  In a terminal window:
```
    $ cd <StrategicHR directory>
    $ bundle
```
6.  Start the PostgreSQL server
7.  Startup the Redis server & background task:
    redis-server
7.  Verify the Redis Server is operational by running:
    redis-cli ping
    If get a PONG response, then Redis is running
8.  Startup Resque background process
```
    worker:
    $ rake resque:work QUEUE=*
```

* Create an Administrative User
---
1.  Bring up the StrategicHR app, register as a new user
2.  In the terminal window, use Rails Console to manually create an administrative user with the account type of "admin"


* Configuration
---

1. Use photoshop, or some other graphics software to customize the course Certificate located in app/assets/images/strategichrcertificate.png

2.  Configure Email

Emails are sent to new users when they register in order to confirm their
email address.  Do the following to setup email:

  a.  Copy the "config/application.example.yml" file, and remove "example" from the name.

  b.  Specify your production and development email configurations in this file. Your application.yml should contain your sensitive credentials. It should be included in .gitIgnore as well.

3.  Establish a Stripe Account For Payment:

4.  Configure Environment Variables</b>

* Create New Courses
---
Log in to StrategicHR as an administrative user, and do the following to create a new course:

1.  <u>Add video.</u> Once a video has been uploaded to youtube, copy the url for the video, then click on the "Videos" button and fill out the information for the video.

2.  <u>Create Quiz.</u>

3.  Create Course. Enter the Name, Description, Ceu code & credits, choose a Video, & choose a Quiz


* Running the test suite
---
```
$ bundle exec cucumber
$ rspec spec
$ rake test
```


* Services (job queues, cache servers, search engines, etc.)
---

Video event monitoring background process.  A background process is included to monitor when users watch videos.  When users start/stop videos, events are added to a queue for a background Resque process.  The Resque process logs that event in the postgreSQL Log table, and calculates the amount of time a user has spent watching a video and stores it in the postgreSQL Stat table.

```
* Screenshot

![home page](./doc/home-page.png)
