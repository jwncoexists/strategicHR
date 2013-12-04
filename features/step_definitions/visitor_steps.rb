When(/^I go to the strategicHR home page$/) do
  visit root_path 
end

Then(/^I see a title of strategicHR$/) do
  expect(page).to have_content "Strategic HR Training by Dr. Bob Nelson"
end

When(/^I go to the contact page$/) do
  visit ('/contact')
end

Then(/^I can send a message$/) do
  fill_in 'Name', with: 'Jennifer Nelson'
  fill_in 'Email', with: 'jenniferwnelson@example.com'
  fill_in 'Subject', with: 'Test Contact Form'
  fill_in 'Body', with: 'Hello and thank you for this class'
  click_button "Submit"
  expect(page).to have_content 'success'
end

Given(/^I am a visitor to the course page for "(.*?)"$/) do |name|
  @course = Course.create(name: name, description: name)
  @course = Course.find_by_name! name
  visit(course_path(@course))
end

Then(/^I see visitor information about the course$/) do
  expect(page).to have_content @course.name
end

Then(/^I am prompted to either sign\-in or register$/) do
  expect(page).to have_content "Sign-in"
  expect(page).to have_content "Register"
end

Given(/^I am a visitor to the registration page$/) do
  visit(new_user_path)
end

When(/^I enter required registration information$/) do
  fill_in "Name:", with: "Test User"
  fill_in "Email:", with: "bob@example.com"
  fill_in "Password:", with: "5555"
  fill_in "Confirm password:", with: "5555"
end

When(/^I click the Register button$/) do
  click_button "Register"
end

Then(/^I am directed to the login screen with a notice to confirm my email address$/) do
  expect(page).to have_content "An email has been sent"
  expect(page).to have_content "Please Sign-in"
end
