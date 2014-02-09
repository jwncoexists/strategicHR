require 'spec_helper'

describe VideoTime do
  # user_id, video_url, status, time
  describe "perform" do
    it "creates a log entry" do
      user = create(:user)
      video = create(:video)
      VideoTime.perform user.id, video.url, "start", Time.now
      Log.count.should be(1)
    end
  end

end