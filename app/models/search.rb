class Search < ActiveRecord::Base
  #attr_accessible :keywords, :category_id, :address, :minimum_price, :maximum_price
  def posts
    @posts ||= find_posts
  end
  
  private

  def find_posts
    search = Post.search
    search.title_like(keywords) unless keywords.blank?
    search.address_like(address) unless address.blank?
    search.price_gte(minimum_price) unless minimum_price.blank?
    search.price_lte(maximum_price) unless maximum_price.blank?
    search.category_id_equals(category_id) unless category_id.blank?
    search.all
  end
end
