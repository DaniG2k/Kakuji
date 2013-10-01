class DropParticipants < ActiveRecord::Migration
  def change
    drop_table :participants
  end
end
