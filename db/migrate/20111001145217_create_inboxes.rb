class CreateInboxes < ActiveRecord::Migration
  def self.up
    create_table :inboxes do |t|
      t.integer :user_id
      t.string :content
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :inboxes
  end
end
