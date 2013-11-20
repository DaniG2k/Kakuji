class MessagesController < ApplicationController
  before_action :authenticate_user!
  around_action :catch_not_found
  
  def index
    id = current_user.id
    @messages = Message.where('sender_id = ? or recipient_id = ?', id, id).group(:recipient_id)
  end
  
  def show
    message = Message.find params[:id]
    sender = message.sender_id
    recipient = message.recipient_id
    @conversation = Message.where('(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)', sender, recipient, recipient, sender)
    @reply_to_user = current_user.id.eql?(sender) ? recipient : sender
  end
  
  def new
    @user = User.find params[:recipient_id]
    if @user == current_user
      redirect_to tutors_path
    else
      @message = Message.new
    end
  end
  
  def create
    @user = User.find params[:recipient_id]
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = @user

    if @message.save
      redirect_to messages_path
    else
      render 'new'
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:subject, :body)
    end
    
    def catch_not_found
      yield
    rescue ActiveRecord::RecordNotFound
      redirect_to tutors_path, flash: { notice: t('recipient_not_found', scope: 'errors.messages') }
    end
end
