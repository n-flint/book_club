require 'rails_helper'

describe User, type: :model do

  describe "relationships" do
    it {should have_many(:reviews)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "class methods" do

    it '.top_users' do

    book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: 'cover')
    book_1.authors.create(name: "Peregrine")
    book_2 = Book.create(title: "What's New Pussy Cat", pages: 200, published: 1999, cover: 'cover')
    book_2.authors.create(name: "Noah")
    book_3 = Book.create(title: "Killing Time", pages: 105, published: 1992, cover: 'cover')
    book_3.authors.create(name: "Peregrine")
    book_4 = Book.create(title: "Testing Books", pages: 200, published: 2010, cover: 'cover')
    book_4.authors.create(name: "Peregrine")
    book_5 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: 'cover')
    book_5.authors.create(name: "Peregrine")

    user_1 = User.create(name: "Tim Allen")
    user_2 = User.create(name: "Scott Thomas")
    user_3 = User.create(name: "Noah Flint")
    user_4 = User.create(name: "Peregrine Balas")

    review_1 = book_1.reviews.create(title: "Best book ever", user_id: user_1.id, rating: 5, review: "A must read")
    review_2 = book_1.reviews.create(title: "Goody bookie", user_id: user_2.id, rating: 4, review: "Good good")
    review_3 = book_2.reviews.create(title: "New Favorite book ever", user_id: user_3.id, rating: 5, review: "A tour de force")
    review_4 = book_1.reviews.create(title: "Kinda sorta", user_id: user_4.id, rating: 3, review: "Eh")
    review_5 = book_1.reviews.create(title: "An OKish Read", user_id: user_4.id, rating: 2, review: "Probably leave it")
    review_6 = book_1.reviews.create(title: "BOO", user_id: user_4.id, rating: 1, review: "I died inside")
    review_7 = book_1.reviews.create(title: "Awful", user_id: user_4.id, rating: 1, review: "Leave it!")
    review_8 = book_3.reviews.create(title: "Best book ever", user_id: user_1.id, rating: 5, review: "A must read")
    review_9 = book_3.reviews.create(title: "Goody bookie", user_id: user_1.id, rating: 5, review: "Good good")
    review_10 = book_4.reviews.create(title: "Kinda sorta", user_id: user_1.id, rating: 3, review: "Eh")
    review_11 = book_4.reviews.create(title: "An OKish Read", user_id: user_2.id, rating: 2, review: "Probably leave it")
    review_12 = book_5.reviews.create(title: "BOO", user_id: user_4.id, rating: 4, review: "I died inside")
    review_13 = book_5.reviews.create(title: "Awful", user_id: user_4.id, rating: 4, review: "Leave it!")

    expected = [user_4, user_1, user_2]
    actual = User.most_reviews

    expect(actual).to eq(expected)

    end

  end

  describe "instance methods" do

    it '.review_count' do

      book_1 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: 'cover')
      book_1.authors.create(name: "Peregrine")
      book_2 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: 'cover')
      book_1.authors.create(name: "Peregrine")

      user = User.create(name: "Tim Allen")
      review_1 = book_1.reviews.create(title: "Best book ever", user_id: user.id, rating: 5, review: "A must read")
      review_2 = book_2.reviews.create(title: "Goody bookie", user_id: user.id, rating: 4, review: "Good good")

      expected = 2
      actual = user.review_count

      expect(actual).to eq(expected)
    end

  end
end
