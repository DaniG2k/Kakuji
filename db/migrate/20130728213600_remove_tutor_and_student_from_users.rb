class RemoveTutorAndStudentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tutor, :boolean
    remove_column :users, :student, :boolean
  end
end
