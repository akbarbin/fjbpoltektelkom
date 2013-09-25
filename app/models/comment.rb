class Comment < ActiveRecord::Base
  belongs_to  :post
  belongs_to  :user

  #validasi comment
  validates_presence_of :content
end
