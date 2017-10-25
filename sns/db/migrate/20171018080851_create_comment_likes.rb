class CreateCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_likes do |t|
      t.references :comment, foreign_key: true, index: false, null: false
      t.references :user, foreign_key: true, index: false, null: false

      t.timestamps
    end
    add_index :comment_likes, :user_id
    add_index :comment_likes, [:comment_id, :user_id], unique: true
  end
end
