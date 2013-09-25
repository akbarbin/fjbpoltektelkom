class Offer < ActiveRecord::Base
  belongs_to  :post
  belongs_to  :user

  validates_presence_of :content
  validates_numericality_of :content
end
