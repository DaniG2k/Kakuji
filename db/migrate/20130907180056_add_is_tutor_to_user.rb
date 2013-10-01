class AddIsTutorToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_tutor, :boolean
  end
end
