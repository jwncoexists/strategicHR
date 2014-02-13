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

Given(/^quiz named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the quiz "(.*?)" is assigned to course "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end




Given(/^I have purchased a certificate for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I visit my certificates page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can view my "(.*?)" certificate$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can print my "(.*?)" certificate$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I visit  my certificates page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can email my "(.*?)" certificate$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the email confirmation page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a confirmation that I my registration with strategicHR is complete$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to my account page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see information about my account$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted with a form to change my password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted with a form to change my email address$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted with a form to update my profile$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to my certificates page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see information about all of the certificates I have ordered, and certificates that are available to order$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on a link to purchase a certificate for a completed class named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted to enter my credit card information for purchasing the certificate$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the quiz page for a course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see my status for the quiz and links to start or resume the quiz$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the quiz page for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the link to start the "(.*?)" quiz$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the first question for the quiz$/) do
  pending # express the regexp above with the code you wish you had
end


When(/^I click on the link to start the "(.*?)" video$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the video starts playing$/) do
  pending # express the regexp above with the code you wish you had
end