class AddUserRefToTutors < ActiveRecord::Migration
  def change
    add_reference :tutors, :user, index: true
  end
end
