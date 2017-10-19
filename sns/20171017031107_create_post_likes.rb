class CreatePostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_likes do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :post_likes, :user_id, unique: true
    add_index :post_likes, :post_id
    add_index :post_likes, [:post_id, :user_id], unique: true
  end
end
