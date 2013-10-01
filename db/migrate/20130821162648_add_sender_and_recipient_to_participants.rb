class AddSenderAndRecipientToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :sender_id, :integer
    add_column :participants, :recipient_id, :integer
  end
end
