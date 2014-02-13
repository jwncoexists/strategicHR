#------------------------
# admin/home_page.feature
#------------------------
When(/^I log in as an administrative user$/) do

  visit(new_user_path)
  fill_in 'signup-first-name-page', with: 'admin'
  fill_in 'signup-last-name-page', with: 'user'
  fill_in 'signup-email-page', with: 'testadmin@example.com'
  fill_in 'signup-password-page', with: 'adminpassword'
  fill_in 'signup-password-confirm-page', with: 'adminpassword'
  click_button('Register') 

  @user = User.find_by_email!('testadmin@example.com')
  @user.update_attribute(:confirmed_at, Time.now)
  @user.update_attribute(:account, 'admin')

  if (@user.confirmed_at.nil? || @user.account != 'admin')
    fail("Unable to set administrative attributes for user")
  end

  visit(login_path)
  fill_in 'login-email-page', with: 'testadmin@example.com'
  fill_in 'login-password-page', with: 'adminpassword'

  within_fieldset 'login-page' do
    click_button('Login')
  end
  page.should have_selector ".alert", text: "You are now logged in to StrategicHR Online Training."
  # save_and_open_page
end

Then(/^I can see links to administrative functions$/) do
  # only admins can update users
  # puts page.body
  expect(page).to have_content "Users"
end

#-----------------------------
# Admin manage_courses.feature
#-----------------------------

Given(/^a courses administrative user named "(.*?)"$/) do |name|
  @user = User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "#{name}@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
    account: 'admin'
  )
end

Given(/^I log in as a courses administrator named "(.*?)"$/) do |name|
  visit('/login')
  fill_in 'Email:', with: "#{name}@example.com"
  fill_in 'Password:', with: "letmeinplease"
  within_fieldset 'login-page' do
    click_button('Login')
  end
end

Given(/^I visit the Manage Courses home page$/) do
   visit(courses_path)
end

Then(/^I can create a new course named "(.*?)"$/) do |name|
  #puts page.body
  click_link('New Course')
  fill_in 'Name', with: name
  fill_in 'Description', with: Faker::Lorem.paragraph
  fill_in 'CEU', with: 5
  fill_in 'Price', with: 39.99
  check('Released')
  page.select Video.first.name
  page.select Quiz.first.name
  click_button('Save')
  expect(page).to have_content name
end

Given(/^a course named "(.*?)"$/) do |name|
  @course = Course.create!(name: name, 
                           description: Faker::Lorem.paragraph,
                           released: true)
  section = @course.sections.build
  ceu = @course.ceus.build
end

When(/^I edit the course named "(.*?)" course$/) do |name|
  visit(edit_course_path(@course))
end

When(/^change the course name to "(.*?)"$/) do |name|
  fill_in 'Name', with: name
  click_button('Save')
  @course.name = name
end

Then(/^the name of the course is stored$/) do
  expect(page).to have_content @course.name
end

Given(/^a Video named "(.*?)"$/) do |name|
  @video = Video.create!(name: name, 
                         description: Faker::Lorem.paragraph, 
                         length: 30, 
                         presenter: 'admin', 
                         url: 'www.youtube.com')
end

Given(/^a Quiz named "(.*?)"$/) do |name|
  @quiz = Quiz.create!(name: name, 
                       description: Faker::Lorem.paragraph, 
                       passing_score: 70, 
                       num_questions_to_show: 10)
end

When(/^add the video named "(.*?)" to the course$/) do |name|
  # select(name, from: 'course[sections_attributes][0][video_id]')
  # will just default to this video since there's only one
end

When(/^add the quiz named "(.*?)" to the course$/) do |name|
  # quiz should be selected by default, since only one
end

Then(/^the video and quiz are stored in the course$/) do
  click_button('Save')
  if !@course.sections.first.video_id == @video.id
    fail("Video was not stored for the course")
  end
  if !@course.sections.first.quiz_id == @quiz.id
    fail("Quiz was not stored for the course")
  end
end

Given(/^a course I want to delete named "(.*?)"$/) do |name|
  step 'a course named "Strategic HR Overview"'
end

When(/^I view the "(.*?)" course$/) do |name|
  visit(course_path(@course))
  if !page.text.include? name
    fail("Unable to go to page for course: #{name}")
  end
end

Then(/^I can delete the course$/) do
  click_link('Delete Course')
  Course.find_by_id(@course.id).should be_nil
  #Course.where(name: @course.name).count.should be(0)
end

#---------------------------
# Admin manage_videos.feature
#---------------------------
Given(/^a videos administrative user named "(.*?)"$/) do |name|
  @user = User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "#{name}@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
    account: 'admin' 
  )
end

Given(/^I log in as the videos "(.*?)"$/) do |name|
  visit('/login')
  fill_in 'email', with: "#{name}@example.com"
  fill_in 'password', with: "letmeinplease"
  within_fieldset 'login-page' do
    click_button('Login')
  end
end

Given(/^I visit the Videos page$/) do
  visit(videos_path)
end

Then(/^I can add a new video named "(.*?)"$/) do |name|
  #puts page.body
  click_link('Add Video')
  fill_in 'Name:', with: name
  fill_in 'Description:', with: Faker::Lorem.paragraph
  fill_in 'Length:', with: 5
  fill_in 'Presenter', with: Faker::Name.name
  fill_in 'URL', with: 'http://www.youtube.com/watch?v=pIVREol3Zsc'
  click_button('Save')
  expect(page).to have_content name
end

Given(/^a video named "(.*?)"$/) do |name|
  @video = Video.create!(name: name, 
                         description: Faker::Lorem.paragraph, 
                         length: 6, 
                         presenter: Faker::Name.name, 
                         url: 'http://www.youtube.com/watch?v=pIVREol3Zsc')
end

When(/^I edit the the "(.*?)" video$/) do |name|
  visit(edit_video_path(@video))
  expect(page).to have_content 'Edit Video'
end

When(/^change its url to "(.*?)"$/) do |url|
  @url = url
  fill_in 'URL:', with: url
  @video.url = url
  click_button('Save')
 
end

Then(/^the url of the video is stored$/) do
   Video.find_by_url!(@url)
end

When(/^I view the "(.*?)" video$/) do |name|
  visit(video_path(@video))
  if !page.text.include? name
    fail("Unable to go to page for video: #{name}")
  end
end

Then(/^I can delete the video$/) do
  click_link('Delete Video')
  #Video.find_by_id(@video.id).should be_nil
  Video.where(name: @video.name).count.should be(0)
end

#------------------------
# Admin manage_quizzes.feature
#------------------------

Given(/^a quizzes administrative user named "(.*?)"$/) do |name|
    @user = User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "#{name}@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
    account: 'admin' )
end

Given(/^I log in as the quizzes "(.*?)"$/) do |name|
  visit('/login')
  fill_in 'email', with: "#{name}@example.com"
  fill_in 'password', with: "letmeinplease"
  within_fieldset 'login-page' do
    click_button('Login')
  end
end

Given(/^I visit the Quizzes page$/) do
  visit(quizzes_path)
end

Then(/^I can create a new quiz named "(.*?)"$/) do |name|
  click_link('New Quiz')
  fill_in 'Name', with: name
  click_button('Save')
  Quiz.find_by_name!(name)
end

Given(/^a quiz named "(.*?)"$/) do |name|
  click_link('New Quiz')
  fill_in 'Name', with: name
  click_button('Save')
  @quiz = Quiz.find_by_name!(name)
  @name = name
end

When(/^I edit the quiz named "(.*?)" quiz$/) do |name|
  visit(edit_quiz_path(@quiz))
  page.should have_content(name)
end

When(/^change the quiz name to "(.*?)"$/) do |name|
  @editedname = name
  fill_in 'Name', with: name
  click_button('Save')
end

Then(/^the name of the quiz is stored$/) do
   Quiz.find_by_name!(@editedname)
end

When(/^add a question named, "(.*?)"$/) do |name|
  click_link('Add Question')
  #puts page.body
  # type_into_keyboard("My Question", append_return: false)
  click_button('Save')
end

Then(/^the question is added to the quiz$/) do
  if (@quiz.questions.count <= 0)
    fail("Question not added to quiz, count = #{@quiz.questions.count}")
  end
end

Given(/^a question named "(.*?)"$/) do |name|
  @question = @quiz.questions.build
  @question.content = name
  @quiz.save
end

When(/^delete the question named, "(.*?)"$/) do |name|
  @prevcount = @quiz.questions.count
  page.check('quiz_questions_attributes_0__destroy')
  #puts page.body
  # type_into_keyboard("My Question", append_return: false)
  click_button('Save')

end

Then(/^the question is removed from the quiz$/) do
  if (@quiz.questions.count == @prevcount)
    fail("Question could not be deleted fromt the quiz: #{name}, #questions: #{@quiz.questions.count}")
  end
end

When(/^I view the "(.*?)" Quiz$/) do |name|
  @quiz = Quiz.find_by_name(name)
  visit(quiz_path(@quiz))
  if !page.text.include? name
    fail("Unable to go to page for quiz: #{name}")
  end
end

Then(/^I can delete the quiz$/) do
  click_link('Delete Quiz')
  Quiz.find_by_id(@quiz.id).should be_nil
  Question.find_by_quiz_id(@quiz.id).should be_nil
  #Quiz.where(name: @quiz.name).count.should be(0)
end

#---------------------------
# Admin manage_users.feature
#---------------------------
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


