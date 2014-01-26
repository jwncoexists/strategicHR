class NotificationsMailer < ActionMailer::Base
  default from: "bob@drbobnelson.com"

  def new_message(message)
    @message = message
    mail to: "bob@drbobnelson.com", subject: "StrategicHR: #{message.subject}"
  end
end
