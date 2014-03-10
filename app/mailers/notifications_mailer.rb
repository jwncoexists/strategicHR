class NotificationsMailer < ActionMailer::Base
  default from: "bob@drbobnelson.com"

  def new_message(message)
    @message = message
    mail to: "bob@drbobnelson.com", cc: "jenniferwnelson@sbcglobal.net", subject: "StrategicHR: Message from a User"
  end
end
