require 'rails_helper'

describe Book, type: :model do

  describe "relationships" do
    it {should have_many(:authors)}
  end

  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:published)}
  end

  describe "class methods" do
  end

  describe "instance methods" do

    it '.author_names' do
      book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: 'cover')
      book_1.authors.create(name: "Peregrine")
      book_1.authors.create(name: "Noah")

      expected = "Peregrine, Noah"
      actual = book_1.author_names

      expect(actual).to eq(expected)
    end
  end
end
