class UserMailer < ActionMailer::Base
  default from: "bob@drbobnelson.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset for Dr. Bob Nelson's StrategicHR Training"
  end

  def email_receipt(user, certificate)
    @user = user
    @certificate = certificate
    @course = Course.find(@certificate.course_id)
    @ceu = Ceu.find(@certificate.ceu_id)
    mail :to => user.email, :subject => "Receipt for Purchase / StrategicHR by Dr. Bob Nelson"
  end
end
