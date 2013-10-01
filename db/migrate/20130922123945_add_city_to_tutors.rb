class AddCityToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :city, :string
  end
end
