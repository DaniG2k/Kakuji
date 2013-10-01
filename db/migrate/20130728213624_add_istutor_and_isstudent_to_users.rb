class AddIstutorAndIsstudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_tutor, :boolean
    add_column :users, :is_student, :boolean
  end
end
