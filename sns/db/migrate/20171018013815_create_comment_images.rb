class CreateCommentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_images do |t|
      t.string :image, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
  end
end
