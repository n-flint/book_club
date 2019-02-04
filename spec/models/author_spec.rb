require 'rails_helper'

describe Author, type: :model do

  describe "relationships" do
    it {should have_many(:books)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "class methods" do
  end

  describe "instance methods" do

    it '.co_authors' do
      book_1 = Book.create(title: "The Big Old Book", pages: 5000, published: 1811, cover: 'cover')
      book_1.authors.create(name: "Peregrine Balas")
      book_1.authors.create(name: "Noah Flint")
      book_1.authors.create(name: "Peter Lapicola")

      author = Author.find_by(name: "Noah Flint")
      co_authors = Author.where.not(name: "Noah Flint")

      expect(author.co_authors(book_1)).to eq(co_authors)
    end
  end
end
