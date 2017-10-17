class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.string :image, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
