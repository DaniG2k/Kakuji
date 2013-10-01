class RenameTutorEducationToEducationalExperiences < ActiveRecord::Migration
  def self.up
    rename_table :tutor_educations, :educational_experiences
  end
  def self.down
    rename_table :educational_experiences, :tutor_educations
  end
end
