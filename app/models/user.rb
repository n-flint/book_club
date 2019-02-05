class User < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :reviews

  def self.most_reviews
    joins(:reviews).select('users.*, COUNT(reviews.id) as count_reviews').group(:id).order('count_reviews desc').limit(3)
  end

  def review_count
    reviews.count
  end
end
