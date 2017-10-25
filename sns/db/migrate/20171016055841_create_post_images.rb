class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.references :post, foreign_key: true, index: true, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
