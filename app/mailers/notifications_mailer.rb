class NotificationsMailer < ActionMailer::Base
  default from: "jenniferwnelson@sbcglobal.net"

  def new_message(message)
    @message = message
    mail to: "bob@drbobnelson.com", subject: "[http://strategichr.herokuapp.com] #{message.subject}"
  end
end
