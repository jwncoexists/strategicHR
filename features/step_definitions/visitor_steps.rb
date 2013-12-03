When(/^I go to the strategicHR home page$/) do
  visit root_path 
end

Then(/^I see a title of strategicHR$/) do
  expect(page).to have_title "Strategic HR by Dr. Bob Nelson"
end

When(/^I go to the contact page$/) do
  visit contact_path
end

Then(/^I can send a message$/) do

  fill_in 'name', with: 'Jennifer Nelson'
  fill_in "email", with: "jenniferwnelson@sbcglobal.net"
  fill_in 'subject', with: 'Test Contact Form'
  fill_in 'body', with: 'Hello Thank you for this class'
  click_link "submit"
  expect(page).to have_content 'success'
end

When(/^I go to the course page for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see information about the course\.$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the link to take the course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am prompted to either sign\-in or register$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the registration page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a form asking to enter my information to become a registered user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter required registration information$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the Submit button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am directed to the login screen with a notice to confirm my email address$/) do
  pending # express the regexp above with the code you wish you had
end