class MakeUseIdNotNullInTutors < ActiveRecord::Migration
  def change
    change_column :tutors, :user_id, :integer, :null => false
  end
end
