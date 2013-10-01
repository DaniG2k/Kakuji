class AddTutorIdToTutorLanguages < ActiveRecord::Migration
  def change
    add_column :tutor_languages, :tutor_id, :integer
  end
end
