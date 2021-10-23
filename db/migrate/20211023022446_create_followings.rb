class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :following_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
