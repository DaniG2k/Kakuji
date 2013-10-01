class RemoveUserIdFromParticipants < ActiveRecord::Migration
  def change
    remove_column :participants, :user_id, :integer
  end
end
