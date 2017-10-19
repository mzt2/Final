class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followee_id, null: false

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followee_id
    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
end
