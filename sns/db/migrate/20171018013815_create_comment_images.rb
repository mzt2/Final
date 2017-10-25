class CreateCommentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_images do |t|
      t.references :comment, foreign_key: true, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
