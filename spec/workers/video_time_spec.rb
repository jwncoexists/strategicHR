require 'spec_helper'

describe VideoTime do

  let(:user) { User.create! first_name: "Joost", last_name: "Baaij", password: "letmein", password_confirmation: "letmein"}


  # user_id, video_url, status, time
  describe "perform" do
    it "creates a log entry" do
      VideoTime.perform user.id, "video-url", "start", Time.now
      Log.count.should be(1)
    end
  end

end