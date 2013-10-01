class RemoveSpecializationFromTutorEducations < ActiveRecord::Migration
  def change
    remove_column :tutor_educations, :specialization, :string
  end
end
