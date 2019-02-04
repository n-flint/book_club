class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :published
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def self.best
    order(average_rating: :desc).limit(3)
  end

  def self.worst
    order(average_rating: :asc).limit(3)
  end

  def author_names
    authors.pluck(:name).join(', ')
  end

  def best_reviews
    reviews.order(rating: :desc).limit(3)
  end

  def worst_reviews
    reviews.order(rating: :asc).limit(3)
  end

  def average_score
    reviews.average(:rating).round(2)
  end

end
