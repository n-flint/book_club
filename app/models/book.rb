class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :published
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def author_names
    authors.pluck(:name).join(', ')
  end
end
