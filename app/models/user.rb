class User < ActiveRecord::Base
  #authentic login  
  acts_as_authentic do |c|
        c.merge_validates_format_of_email_field_options :message => 'harus seperti email'
  end
  has_many    :inboxs, :dependent => :destroy
  has_many    :posts, :dependent => :destroy
  has_many    :offers, :dependent => :destroy
  has_many    :comments, :dependent => :destroy
  
  #paperclip
  has_attached_file :photo, :styles => { :small => "250x300>" },
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  validates_attachment_presence :photo, :message=> "harus di isi"
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/jpg', 'image/png']


  validates_presence_of :nim, :handphone
  validates_uniqueness_of :nim
  validates_numericality_of :nim, :handphone
  #validates_length_of :nim, :within => 8..9, :too_long => "too long (maximum 8 caracters) ", :too_short => "too short (minimum 8 caracters)"
  #validates_length_of :name, :within => 6..30, :too_long => "too long (maximum 30 caracters)", :too_short => "too short (minimum 6 caracters)"
  #validates_length_of :handphone, :within => 10..12, :too_long => "too long (maximum 12 caracters) ", :too_short => "too short (minimum 10 caracters)"
end
