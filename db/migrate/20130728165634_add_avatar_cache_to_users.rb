class AddAvatarCacheToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_cache, :string
  end
end
