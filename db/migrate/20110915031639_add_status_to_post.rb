class AddStatusToPost < ActiveRecord::Migration
  def self.up
    add_column(:posts, :status, :string)
  end

  def self.down
   remove_column(:posts, :status, :string)
  end
end
