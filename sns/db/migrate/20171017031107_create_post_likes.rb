class CreatePostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_likes do |t|
      t.references :post, foreign_key: true, index: false, null: false
      t.references :user, foreign_key: true, index: false, null: false

      t.timestamps
    end
    add_index :post_likes, :user_id
    add_index :post_likes, [:post_id, :user_id], unique: true
  end
end
