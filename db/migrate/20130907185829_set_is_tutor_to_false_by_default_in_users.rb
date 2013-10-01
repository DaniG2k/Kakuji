class SetIsTutorToFalseByDefaultInUsers < ActiveRecord::Migration
  def change
    change_column :users, :is_tutor, :boolean, :default => false
  end
end
