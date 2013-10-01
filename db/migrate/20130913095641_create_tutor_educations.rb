class CreateTutorEducations < ActiveRecord::Migration
  def change
    create_table :tutor_educations do |t|
      t.string :university
      t.string :major
      t.string :minor
      t.string :specialization
      t.belongs_to :tutor, index: true

      t.timestamps
    end
  end
end
