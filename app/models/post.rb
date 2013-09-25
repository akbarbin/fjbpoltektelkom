class Post < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :category
  has_many    :comments, :dependent => :destroy
  has_many    :offers, :dependent => :destroy
  

  #validation error form
  validates_presence_of :category_id, :title, :price, :content
  validates_length_of :title, :within => 6..40, :too_long => "too long title", :too_short => "too short title"
  validates_numericality_of :price, :message=> "Error must be numerically"

  #paperclip
  has_attached_file :photo, :styles => { :small => "200x250>" },
                    :url  => "/assets/semangats/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/semangats/:id/:style/:basename.:extension"

  validates_attachment_presence :photo                  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/jpeg', 'image/png']                  

  #search, pagination    
end
