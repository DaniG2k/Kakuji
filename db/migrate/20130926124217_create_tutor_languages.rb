class CreateTutorLanguages < ActiveRecord::Migration
  def change
    create_table :tutor_languages do |t|
      t.string :language
      t.string :proficiency

      t.timestamps
    end
  end
end
