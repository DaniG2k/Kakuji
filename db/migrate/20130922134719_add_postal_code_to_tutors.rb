class AddPostalCodeToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :postalcode, :string
  end
end
