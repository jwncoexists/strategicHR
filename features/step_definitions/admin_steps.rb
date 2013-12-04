#------------------------
# admin/home_page.feature
#------------------------
When(/^I log in as an administrative user$/) do

  visit(new_user_path)
  fill_in 'Name:', with: 'Test Admin User'
  fill_in 'Email:', with: 'admin@example.com'
  fill_in 'Password:', with: 'admin'
  fill_in 'Confirm password:', with: 'admin'
  click_button('Register') 

  @user = User.find_by_email('admin@example.com')
  if !@user.update_attribute(:confirmed_at, Time.now)
    fail('Unable to update confirmed_at attribute for admin user')
  end
  if !@user.update_attribute(:account, 'admin')
    fail('Unable to update account for admin user')
  end
  if User.count < 1
    fail('User not added to database')
  end

  visit('/login')
  fill_in 'email', with: 'admin@example.com'
  fill_in 'password', with: 'admin'
  click_button('Sign-in')
end

When(/^I visit the admin home page$/) do
  visit(root_path)
end

Then(/^I can see links to administrative functions$/) do
  # only admins can manage users
  expect(page).to have_content "Users"
end

#-----------------------------
# Admin manage_courses.feature
#-----------------------------

Given(/^an administrative user named "(.*?)"$/) do |name|
  visit(new_user_path)
  fill_in 'Name:', with: name
  fill_in 'Email:', with: "#{name}@example.com"
  fill_in 'Password:', with: name
  fill_in 'Confirm password:', with: name
  click_button('Register') 

  @user = User.find_by_email! "#{name}@example.com"
  if !@user.update_attribute(:confirmed_at, Time.now)
    fail('Unable to update confirmed_at attribute for admin user')
  end
  if !@user.update_attribute(:account, 'admin')
    fail('Unable to update account for admin user')
  end
  if User.count < 1
    fail('User not added to database')
  end
end

Given(/^I log in as "(.*?)"$/) do |name|
  visit('/login')
  fill_in 'email', with: "#{name}@example.com"
  fill_in 'password', with: name
  click_button('Sign-in')
end

Given(/^I visit the Manage Courses home page$/) do
   visit(courses_path)
end

Given(/^a course named "(.*?)"$/) do |name|
  @course = Course.create(name: name, description: name)
  @course = Course.find_by_name! name
end

Then(/^I can create a new course named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the course named "(.*?)" course$/) do |name|
  visit(edit_course_path(@course))
  fill_in 'Name', with: "Course-#{name}-Edited"
  click_button('Save')

end

Then(/^the name of the course is stored$/) do
  expect(page).to have_content "Course-#{name}-Edited"
end

Given(/^a course I want to delete named "(.*?)"$/) do |name|
  @course = Course.create(name: name, description: name)
  @course = Course.find_by_name! name
end

When(/^I view the "(.*?)" course$/) do |name|
  visit(course_path(@course))
  if !page.text.include? name
    fail("Unable to go to page for course: #{name}")
  end
end

Then(/^I can delete the course$/) do
  # page.evaluate_script('window.confirm = function() { return true; }')
  click_link('Delete Course')
  # page.driver.browser.switch_to.alert.accept
  if page.text.include? @course.name
    fail("Unable to delete course #{@course.name}")
  end
end

#------------------------
# Admin manage_certificates feature
#------------------------

When(/^I visit the admin manage certificates page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can create a new certificate named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a certificate "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the "(.*?)" certificate$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^change its name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the name of the certificate is stored$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can delete the certificate$/) do
  pending # express the regexp above with the code you wish you had
end

#------------------------
# Admin manage_quizzes.feature
#------------------------

When(/^I visit the admin quiz page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can create a new quiz named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a quiz "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the "(.*?)" quiz$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the name of the quiz is stored$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a question, "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^add the question "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the question is added to the quiz$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^delete the question "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the question is removed from the quiz$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can delete the quiz$/) do
  pending # express the regexp above with the code you wish you had
end

#------------------------
# Admin manage_users.feature
#------------------------
When(/^I visit the admin manage users page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can create a new user named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a user "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit "(.*?)" user$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^change his name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the name of the user is stored$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the "(.*?)" user$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can delete the user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the manage users page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can export the user list to a tab delimited text file$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can send an email to the user list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can view emails which have been sent to the user list$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the admin video page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can add a new video named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a video "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the "(.*?)" video$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the name of the video is stored$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can delete the video$/) do
  pending # express the regexp above with the code you wish you had
end
