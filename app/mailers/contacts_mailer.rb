class ContactsMailer < ActionMailer::Base
  default :to => "byakugan.87@gmail.com"

  def new_message(message)
    @message = message # Needed for view?
    mail(:from => @message.email)
  end
end
