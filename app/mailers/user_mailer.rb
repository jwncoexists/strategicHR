class UserMailer < ActionMailer::Base
  default from: "bob@drbobnelson.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset for Dr. Bob Nelson's StrategicHR Training"
  end
end
