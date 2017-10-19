class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :privacy, default: 0, null: false

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
