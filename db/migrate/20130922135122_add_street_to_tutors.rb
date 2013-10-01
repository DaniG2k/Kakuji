class AddStreetToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :street, :string
  end
end
