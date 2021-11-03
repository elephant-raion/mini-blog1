class AddIndexLiking < ActiveRecord::Migration[6.1]
  def change
      add_index :likings, [:micropost_id, :user_id], unique: true
  end
end
