class ContactsMailer < ActionMailer::Base
  default :to => "danielep@asia-gazette.com"

  def new_message(message)
    @message = message # Needed for view?
    mail(:from => @message.email)
  end
end
