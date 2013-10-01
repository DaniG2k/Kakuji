class AddCountryToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :country, :string
  end
end
