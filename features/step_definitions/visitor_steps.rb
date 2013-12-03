When(/^I go to the strategicHR home page$/) do
  visit root_path 
end

Then(/^I see a title of strategicHR$/) do
  expect(page).to have_title "Strategic HR by Dr. Bob Nelson"
end

When(/^I go to the contact page$/) do
  visit ('/contact')
end

Then(/^I can send a message$/) do

  fill_in 'Name', with: 'Jennifer Nelson'
  fill_in "Email", with: "jenniferwnelson@sbcglobal.net"
  fill_in 'Subject', with: 'Test Contact Form'
  fill_in 'Body', with: 'Hello Thank you for this class'
  click_button "Submit"
  expect(page).to have_content 'success'
end

When(/^I go to the course page for "(.*?)"$/) do |arg1|
  visit course_path(Course.find_by_name(arg1)) # express the regexp above with the code you wish you had
end

Then(/^I see information about the course\.$/) do
  expect(page).to have_content arg1
end

When(/^I click on the link to take the course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted to either sign\-in or register$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the registration page$/) do
  visit ('/users/new')
end

Then(/^I see a form asking to enter my information to become a registered user$/) do
  expect(page).to have_content "Register"
end

When(/^I enter required registration information$/) do
  fill_in "Name:", with: "Bob Nelson"
  fill_in "Email:", with: "bobrewards@aol.com"
  fill_in "Password:", with: "5555"
  fill_in "Confirm password:", with: "5555"

end

When(/^I click the Submit button$/) do
  click_button "Create User"
  expect(page).to have_content 'success'
end

Then(/^I am directed to the login screen with a notice to confirm my email address$/) do
  expect(page).to have_content 'Sign-in'
end