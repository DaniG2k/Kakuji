class RemoveLangFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :lang, :string
  end
end
