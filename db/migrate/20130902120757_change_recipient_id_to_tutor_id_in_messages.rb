class ChangeRecipientIdToTutorIdInMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :recipient_id, :tutor_id
  end
end
