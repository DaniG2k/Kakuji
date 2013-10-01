class RemoveNameAndBirthdayFromTutors < ActiveRecord::Migration
  def change
    remove_column :tutors, :name, :string
    remove_column :tutors, :birthday, :date
  end
end
