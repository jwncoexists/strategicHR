#------------------------
# user/sign_in.feature
#------------------------
Given(/^I am a visitor$/) do
end

When(/^I go to the sign\-in page$/) do
  visit(login_path)
end

Then(/^I see a form asking me for information to sign in to StrategicHR$/) do
  expect(page).to have_content "Please Login"
end

Given(/^I am a user$/) do
  @user = User.create!(
    first_name: "member",
    last_name: "user",
    email: "#member@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
  )
end

When(/^I enter my user name and password$/) do
  visit(login_path)
  fill_in 'login-email-page', with: @user.email
  fill_in 'login-password-page', with: @user.password
  within_fieldset 'login-page' do
    click_button('Login')
  end
end

Then(/^I see My Courses page$/) do
  page.should have_selector ".alert", text: "You are now logged in to StrategicHR Online Training."
  expect(page).to have_content "Course Name"
end

Then(/^I do not see Admin functions$/) do
  page.should_not have_selector(:link_or_button, "Users")
end

#------------------------
# user/sign_out.feature
#------------------------
When(/^click the sign\-out link$/) do
  click_link('Logout')
end

Then(/^I see confirmation that I have signed out of StrategicHR$/) do
  expect(page).to have_content "You are now logged out"
end

#------------------------
# my courses.feature
#------------------------
Given(/^a member user named "(.*?)"$/) do |name|
  @user = User.create!(
    first_name: "name",
    last_name: "name",
    email: "#{name}@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
  )
end

Given(/^I log in as member user named "(.*?)"$/) do |name|
  visit(login_path)
  fill_in 'login-email-page', with: @user.email
  fill_in 'login-password-page', with: @user.password
  within_fieldset 'login-page' do
    click_button('Login')
  end
end

Given(/^I visit the Courses page$/) do
  visit(courses_path)
end

Then(/^I see a list all my courses$/) do
  #puts page.body
  expect(page).to have_content "Course Name"
  expect(page).to have_content "Status"
end


When(/^I click on the link to the "(.*?)" course$/) do |name|
  within_table('Course List Table') do
    click_link(name)
  end
end

Then(/^I see the course page for "(.*?)"$/) do |name|
  expect(page).to have_content name
  expect(page).to have_content "Course Videos & Quizzes"
end

#------------------------
# video.feature
#------------------------
Given(/^the video "(.*?)" is assigned to course "(.*?)"$/) do |video, course|
  @section = Section.create!(
      sequence: 1,
      course_id: @course.id,
      video_id: @video.id
  )
end

Given(/^I visit the "(.*?)" course page$/) do |name|
  visit(courses_path)
  within_table('Course List Table') do
    click_link(name)
  end
end

When(/^I go to the video page for "(.*?)"$/) do |name|
  click_link(name)
end

Then(/^I see a link to view the "(.*?)" video$/) do |name|
  #puts page.body
  expect(page).to have_content name
end

#------------------------
# quiz.feature
#------------------------

Given(/^a section for the course "(.*?)" with the quiz "(.*?)"$/) do |course, quiz|
  @section = Section.create!(
      sequence: 1,
      course_id: @course.id,
      quiz_id: @quiz.id
  )
end

Given(/^two questions for the Quiz named "(.*?)"$/) do |name|
  @question1 = Question.create!(
      content: 'What is question 1?',
      quiz_id: @quiz.id
    )
    @question2 = Question.create!(
      content: 'What is question 2?',
      quiz_id: @quiz.id
    )
end

Given(/^two answers for each of the the questions for the quiz name "(.*?)"$/) do |arg1|
  @answer11 = Answer.create!(
      content: 'Correct',
      question_id: @question1.id,
      correct: true
    )
  @answer12 = Answer.create!(
      content: 'Incorrect',
      question_id: @question1.id,
      correct: false
    )    

  @answer21 = Answer.create!(
      content: 'Correct',
      question_id: @question2.id,
      correct: true
    )
  @answer22 = Answer.create!(
      content: 'Incorrect',
      question_id: @question2.id,
      correct: false
    )
end

When(/^I go to the quiz page for "(.*?)"$/) do |name|
  click_link('Take Quiz Link')
end

Then(/^I see a link to start the quiz$/) do
  expect(page).to have_content 'Begin Quiz'
end

When(/^I click on the link to start the quiz named "(.*?)"$/) do |name|
  click_link('Begin Quiz Btn')
end

Then(/^I see the first question for the quiz$/) do
  expect(page).to have_content 'Please select one of the following answers:'
end

When(/^I answer all the questions for the quiz named "(.*?)"$/) do |name|
  choose('answer_Correct')
  click_button('Next')
  choose('answer_Incorrect')
  click_button('Complete Quiz')
end

Then(/^I see my results$/) do
   expect(page).to have_content 'Quiz Results for'
end

#------------------------
# certificate_purchase.feature
#------------------------

Given(/^a successful quiz attempt for the course "(.*?)" and the quiz "(.*?)"$/) do |course, quiz|
  @attempt = Attempt.create!(
          user_id: @user.id,
          section_id: @section.id,
          passed: true,
          status: "PASSED"
  )
end

When(/^I go to the Courses page$/) do
  visit(courses_path)
end

Then(/^I see a link to purchase a certificate for the course named "(.*?)"$/) do |name|
  expect(page).to have_content 'Purchase Certificate'
end

When(/^I click on a link to purchase a certificate for the course named "(.*?)"$/) do |arg1|
  click_link('Purchase Certificate')
end

Then(/^I am prompted for information to purchase the certificate$/) do
 expect(page).to have_content 'Purchase Certificate for:'
end

#------------------------
# certificate.feature
#------------------------

Given(/^I have purchased a certificate for the course named "(.*?)"$/) do |course|
    @certificate = Certificate.create!(
          user_id: @user.id,
          course_id: @course.id,
          purchase_date: Time.now,
          purchase_price: @course.price
        )

end

When(/^I click on the "(.*?)" link$/) do |name|
  click_link(name)
end

Then(/^I can view my "(.*?)" course certificate$/) do |name|
  page.response_headers['Content-Type'].should == 'application/pdf'
end

#------------------------
# email_confirmation.feature
#------------------------
When(/^I go to the email confirmation page$/) do
  @user = User.find_by_email!("test@example.com")
  visit(new_email_confirmation_url(token: @user.token))
end

Then(/^I see a confirmation that my registration with strategicHR is complete$/) do
  expect(page).to have_content('Your registration with StrategicHR by Dr. Bob Nelson has been confirmed.')
end

#------------------------
# my_account.feature
#------------------------
Given(/^I visit My Account page$/) do
  click_link("My Account")
end

Then(/^I see information about my account$/) do
  expect(page).to have_content(@user.name)
  expect(page).to have_content("Edit User Info")
end

Then(/^I am prompted with a form to update my profile$/) do
  expect(page).to have_content("Editing User Info")
end









