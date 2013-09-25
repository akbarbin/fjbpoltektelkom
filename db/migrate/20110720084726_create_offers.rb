class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :content

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
