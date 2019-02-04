# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
@cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
@book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: @cover_1)
@book_1.authors.create(name: "Peregrine")
@book_2 = Book.create(title: "What's New Pussy Cat", pages: 200, published: 1999, cover: @cover_2)
@book_2.authors.create(name: "Noah")
@book_3 = Book.create(title: "Killing Time", pages: 105, published: 1992, cover: @cover_1)
@book_3.authors.create(name: "Peregrine")
@book_4 = Book.create(title: "Testing Books", pages: 200, published: 2010, cover: @cover_1)
@book_4.authors.create(name: "Peregrine")
@book_5 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: @cover_1)
@book_5.authors.create(name: "Peregrine")

@user_1 = User.create(name: "Tim Allen")
@user_2 = User.create(name: "Scott Thomas")
@user_3 = User.create(name: "Noah Flint")
@user_4 = User.create(name: "Peregrine Balas")
@user_5 = User.create(name: "Peter Lapicola")
@user_6 = User.create(name: "Ian Douglas")
@user_7 = User.create(name: "Megan McMahon")

@review_1 = @book_1.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
@review_2 = @book_1.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 4, review: "Good good")
@review_3 = @book_2.reviews.create(title: "New Favorite book ever", user_id: @user_3.id, rating: 5, review: "A tour de force")
@review_4 = @book_1.reviews.create(title: "Kinda sorta", user_id: @user_4.id, rating: 3, review: "Eh")
@review_5 = @book_1.reviews.create(title: "An OKish Read", user_id: @user_5.id, rating: 2, review: "Probably leave it")
@review_6 = @book_1.reviews.create(title: "BOO", user_id: @user_6.id, rating: 1, review: "I died inside")
@review_7 = @book_1.reviews.create(title: "Awful", user_id: @user_7.id, rating: 1, review: "Leave it!")
@review_8 = @book_3.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
@review_9 = @book_3.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 5, review: "Good good")
@review_10 = @book_4.reviews.create(title: "Kinda sorta", user_id: @user_3.id, rating: 3, review: "Eh")
@review_11 = @book_4.reviews.create(title: "An OKish Read", user_id: @user_4.id, rating: 2, review: "Probably leave it")
@review_12 = @book_5.reviews.create(title: "BOO", user_id: @user_5.id, rating: 4, review: "I died inside")
@review_13 = @book_5.reviews.create(title: "Awful", user_id: @user_6.id, rating: 4, review: "Leave it!")
@review_13 = @book_5.reviews.create(title: "Awful", user_id: @user_7.id, rating: 4, review: "Leave it!")
