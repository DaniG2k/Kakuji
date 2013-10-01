class ChangeProficiencyToIntegerInTutorLanguages < ActiveRecord::Migration
  def change
    change_column :tutor_languages, :proficiency, :integer
  end
end
