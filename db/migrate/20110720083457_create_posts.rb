class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string  :title
      t.string  :price
      t.string  :content
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
