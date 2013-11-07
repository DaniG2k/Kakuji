class ContactController < ApplicationController
  def new
    @contact_msg = Contact.new
  end
  
  def create
    @contact_msg = Contact.new params[:contact]
    if @contact_msg.valid?
      ContactsMailer.new_message(@contact_msg).deliver
      render 'thanks'
    else
      render 'new'
    end
  end
end
