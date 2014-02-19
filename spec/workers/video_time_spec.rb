require 'spec_helper'

describe VideoTime do
  # user_id, video_url, status, time
  describe "perform" do
    it "creates log entries and a stat entry" do
      user = create(:user)
      video = create(:video)
      quiz = create(:quiz)
      course = create(:course)
      section = Section.create(sequence: 1, course_id: course.id,
                video_id: video.id, quiz_id: quiz.id )
      VideoTime.perform user.id, video.url, "start", Time.now
      Log.count.should be(1)
      Stat.count.should be(0)
      VideoTime.perform user.id, video.url, "stop", Time.now
      Log.count.should be(2)
      Log.last.tracked.should be(true)
      Stat.count.should be(1)
    end
  end

end