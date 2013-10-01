class MakeSenderRecipientAndBodyNotNullInMessages < ActiveRecord::Migration
  def change
    change_column :messages, :body, :text, :null => false
    change_column :messages, :sender_id, :integer, :null => false
    change_column :messages, :recipient_id, :integer, :null => false
  end
end
