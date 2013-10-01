class RenameTutorIdToRecipientIdInMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :tutor_id, :recipient_id
  end
end
