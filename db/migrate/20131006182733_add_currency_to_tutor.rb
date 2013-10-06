class AddCurrencyToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :currency, :string
  end
end
