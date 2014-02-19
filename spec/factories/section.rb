FactoryGirl.define do
  factory :section do
    sequence 1
    course
    video
    quiz
  end
end