class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :nim
      t.string    :name
      t.integer   :prodi
      t.string   :handphone
      t.integer   :year
      t.string    :status
      t.string    :current_address
      t.string    :username
      t.string    :email      
      t.string    :role
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
