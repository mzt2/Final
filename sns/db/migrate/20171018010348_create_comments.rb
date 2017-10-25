class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, index: false, null: false
      t.string :comment, null: false

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
