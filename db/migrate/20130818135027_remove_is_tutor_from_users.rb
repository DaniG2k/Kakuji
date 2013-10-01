class RemoveIsTutorFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_tutor, :boolean
  end
end
