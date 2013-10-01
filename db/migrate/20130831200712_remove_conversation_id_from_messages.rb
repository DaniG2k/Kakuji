class RemoveConversationIdFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :conversation_id, :integer
  end
end
