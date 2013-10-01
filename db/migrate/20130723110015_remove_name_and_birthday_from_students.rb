class RemoveNameAndBirthdayFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :name, :string
    remove_column :students, :birthday, :date
  end
end
