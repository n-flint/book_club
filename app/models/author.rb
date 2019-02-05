class Author < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :book_authors
  has_many :books, through: :book_authors


  def co_authors(book)
    co_authors = book.authors.where.not(name: name)
  end

end
