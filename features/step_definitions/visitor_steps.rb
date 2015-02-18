When(/^I go to the strategicHR home page$/) do
  visit root_path
end

Then(/^I see a title of strategicHR$/) do
  expect(page).to have_content "StrategicHR"
end

Then(/^I see Dr\. Bob Nelson$/) do
  expect(page).to have_content "Dr. Bob Nelson"
end

Then(/^I see CEU Credits$/) do
  expect(page).to have_content "CEU Credits"
end

When(/^I go to the contact page$/) do
  visit ('/contact')
end

Then(/^I can send a message$/) do
  fill_in 'Name:', with: 'Jennifer Nelson'
  fill_in 'Email:', with: 'jenniferwnelson@example.com'
  fill_in 'Subject:', with: 'Test Contact Form'
  fill_in 'Message:', with: 'Hello and thank you for this class'
  click_button "Submit"
  expect(page).to have_content 'success'
end

Given(/^I am a visitor to the course page for "(.*?)"$/) do |name|
  @course = Course.create!(name: name, description: Faker::Lorem.paragraph)
  visit(course_path(@course))
end

Then(/^I see visitor information about the course$/) do
  expect(page).to have_content @course.name
end

Then(/^I am prompted to either login or sign up$/) do
  expect(page).to have_content "Login"
  expect(page).to have_content "Sign Up"
end

Given(/^I am a visitor to the registration page$/) do
  visit(new_user_path)
end

When(/^I enter required registration information$/) do
  fill_in 'signup-first-name-page', with: "Test"
  fill_in 'signup-last-name-page', with: "User"
  fill_in 'signup-email-page', with: "test@example.com"
  fill_in 'signup-password-page', with: "visitorpassword"
  fill_in 'signup-password-confirm-page', with: "visitorpassword"
end

When(/^I click the Register button$/) do
  click_button "Register"
end

Then(/^I am directed to the login screen with a notice to confirm my email address$/) do
  expect(page).to have_content "A confirmation email has been sent"
  expect(page).to have_content "Please Login"
end
