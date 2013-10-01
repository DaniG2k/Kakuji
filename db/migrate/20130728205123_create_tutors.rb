class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.text :description
      t.decimal :rate
      t.integer :user_id

      t.timestamps
    end
  end
end
