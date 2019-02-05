require 'rails_helper'

describe Book, type: :model do

  before :each do
    @book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: 'cover', average_rating: 2.67)
    @book_1.authors.create(name: "Peregrine")
    @book_3 = Book.create(title: "Killing Time", pages: 105, published: 1992, cover: 'cover', average_rating: 5.0)
    @book_3.authors.create(name: "Peregrine")
    @book_4 = Book.create(title: "Testing Books", pages: 200, published: 2010, cover: 'cover', average_rating: 2.5)
    @book_4.authors.create(name: "Peregrine")
    @book_5 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: 'cover', average_rating: 4.0)
    @book_5.authors.create(name: "Peregrine")

    @user_1 = User.create(name: "Tim Allen")
    @user_2 = User.create(name: "Scott Thomas")

    @review_1 = @book_1.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
    @review_2 = @book_1.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 4, review: "Good good")
    @review_4 = @book_1.reviews.create(title: "Kinda sorta", user_id: @user_1.id, rating: 3, review: "Eh")
    @review_5 = @book_1.reviews.create(title: "An OKish Read", user_id: @user_2.id, rating: 2, review: "Probably leave it")
    @review_6 = @book_1.reviews.create(title: "BOO", user_id: @user_1.id, rating: 1, review: "I died inside")
    @review_7 = @book_1.reviews.create(title: "Awful", user_id: @user_2.id, rating: 1, review: "Leave it!")
  end

  describe "relationships" do
    it {should have_many(:authors)}
  end

  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:published)}
  end

  describe "class methods" do

    it '.best' do

      expected = [@book_3, @book_5, @book_1]
      actual = Book.best

      expect(actual).to eq(expected)

    end

    it '.worst' do

      expected = [@book_4, @book_1, @book_5]
      actual = Book.worst

      expect(actual).to eq(expected)

    end

    # it '.sort_by_most_reviews' do
    #
    #   expected =
    #   actual = Book.sort_by_most_reviews
    #
    #   expect(actual).to eq(expected)
    #
    # end

  end

  describe "instance methods" do

    it '.author_names' do
      book_1 = Book.create(title: "Two Authors", pages: 100, published: 2000, cover: 'cover')
      book_1.authors.create(name: "Peregrine")
      book_1.authors.create(name: "Noah")

      expected = "Peregrine, Noah"
      actual = book_1.author_names

      expect(actual).to eq(expected)
    end

    it '.best_reviews' do

      expected = [@review_1, @review_2, @review_4]
      actual = @book_1.best_reviews

      expect(actual).to eq(expected)
    end

    it '.worst_reviews' do

      expected = [@review_6, @review_7, @review_5]
      actual = @book_1.worst_reviews

      expect(actual).to eq(expected)
    end

    it '.average_score' do

      expected = 2.67
      actual = @book_1.average_score

      expect(actual).to eq(expected)
    end

    it '.review_count' do

      expected = 6
      actual = @book_1.review_count

      expect(actual).to eq(expected)

    end

  end
end
