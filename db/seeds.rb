# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
# @cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
# @book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: @cover_1)

@book_1 = Book.create(title: pages: published:, )
@book_1.authors.create(name: Faker::Book.author)

@book_2 = Book.create(title: pages: published:, )
@book_2.authors.create(name: Faker::Book.author)

@book_3 = Book.create(title: pages: published:, )
@book_3.authors.create(name: Faker::Book.author)

@book_4 = Book.create(title: pages: published:, )
@book_4.authors.create(name: Faker::Book.author)

@book_5 = Book.create(title: pages: published:, )
@book_5.authors.create(name: Faker::Book.author)

@book_6 = Book.create(title: pages: published:, )
@book_6.authors.create(name: Faker::Book.author)

@book_7 = Book.create(title: pages: published:, )
@book_7.authors.create(name: Faker::Book.author)

@book_8 = Book.create(title: pages: published:, )
@book_8.authors.create(name: Faker::Book.author)

@book_9 = Book.create(title: pages: published:, )
@book_9.authors.create(name: Faker::Book.author)

@book_10 = Book.create(title: pages: published:, )
@book_10.authors.create(name: Faker::Book.author)

@book_11 = Book.create(title: pages: published:, )
@book_11.authors.create(name: Faker::Book.author)

@book_12 = Book.create(title: pages: published:, )
@book_12.authors.create(name: Faker::Book.author)

@book_13 = Book.create(title: pages: published:, )
@book_13.authors.create(name: Faker::Book.author)

@book_14 = Book.create(title: pages: published:, )
@book_14.authors.create(name: Faker::Book.author)

@book_15 = Book.create(title: pages: published:, )
@book_15.authors.create(name: Faker::Book.author)

@book_16 = Book.create(title: pages: published:, )
@book_16.authors.create(name: Faker::Book.author)

@book_17 = Book.create(title: pages: published:, )
@book_17.authors.create(name: Faker::Book.author)

@book_18 = Book.create(title: pages: published:, )
@book_18.authors.create(name: Faker::Book.author)

@book_19 = Book.create(title: pages: published:, )
@book_19.authors.create(name: Faker::Book.author)

@book_20 = Book.create(title: pages: published:, )
@book_20.authors.create(name: Faker::Book.author)

@book_21 = Book.create(title: pages: published:, )
@book_21.authors.create(name: Faker::Book.author)

@book_22 = Book.create(title: pages: published:, )
@book_22.authors.create(name: Faker::Book.author)

@user_1 = create(:user)
@user_2 = create(:user)
@user_3 = create(:user)
@user_4 = create(:user)
@user_5 = create(:user)
@user_6 = create(:user)
@user_7 = create(:user)
@user_8 = create(:user)
@user_9 = create(:user)
@user_10 = create(:user)
@user_11 = create(:user)
@user_12 = create(:user)
@user_13 = create(:user)
@user_14 = create(:user)
@user_15 = create(:user)

@review_1 = @book_1.reviews.create(title: "Great", rating: 5, review: "Read this", user_id: @user_1.id)
@review_2 = @book_2.reviews.create(title: "Best Book", rating: 5, review: "This was really something", user_id: @user_2.id)
@review_3 = @book_3.reviews.create(title: "I just couldn't", rating: 1, review: "I had issues with this book", user_id: @user_3.id)
@review_4 = @book_4.reviews.create(title: "Pretty Good So Far", rating: 3, review: "I spilled coffee on this and couldn't finish but I liked what I read", user_id: @user_4.id)
@review_5 = @book_5.reviews.create(title: "Wordy", rating: 2, review: "Too many words not enough pictures", user_id: @user_5.id)
@review_6 = @book_6.reviews.create(title: "I burned it", rating: 2, review: "I was reading by candlelight and the book caught fire, so I can only give it two stars", user_id: @user_6.id)
@review_7 = @book_7.reviews.create(title: "Good", rating: 4, review: "Fun read for sure!", user_id: @user_7.id)
@review_8 = @book_8.reviews.create(title: "I liked it", rating: 4, review: "An entertaining read", user_id: @user_7.id)
@review_9 = @book_9.reviews.create(title: "I recommend this", rating: 4, review: "Not gonna lie, I liked it", user_id: @user_6.id)
@review_10 = @book_10.reviews.create(title: "Cool plot", rating: 4, review: "Good bokk with interesting characters and story", user_id: @user_1.id)
@review_11 = @book_11.reviews.create(title: "Loads of fun", rating: 4, review: "Keep this one by your bedside", user_id: @user_1.id)
@review_12 = @book_12.reviews.create(title: "I liked it!", rating: 4, review: "Cool idea for a book", user_id: @user_2.id)
@review_13 = @book_12.reviews.create(title: "Worth it", rating: 4, review: "This book was only $5 and it's worth every dollar, which again is $5 so it doesn't get a 5 for a rating because I wouldn't have paid $6 for it but it was still really good", user_id: @user_3.id)
@review_14 = @book_12.reviews.create(title: "Yes please!", rating: 4, review: "I hope they write a sequal!", user_id: @user_4.id)
@review_15 = @book_12.reviews.create(title: "Nah", rating: 2, review: "Not for me, or people who like good books", user_id: @user_5.id)
@review_16 = @book_11.reviews.create(title: "Eh", rating: 3, review: "Really so so", user_id: @user_6.id)
@review_17 = @book_11.reviews.create(title: "Evil", rating: 1, review: "This book is full of black magic and curses", user_id: @user_7.id)
@review_18 = @book_10.reviews.create(title: "Lost interest", rating: 2, review: "I just couldn't get into it", user_id: @user_1.id)
@review_19 = @book_9.reviews.create(title: "5 stars", rating: 5, review: "Two thumbs up, I mean WAAAAAY up!", user_id: @user_2.id)
@review_20 = @book_10.reviews.create(title: "Oh yeah, get into this book!", rating: 5, review: "Throw ya nose in here and explore a world beyond your wildest dreams!", user_id: @user_1.id)
@review_21 = @book_11.reviews.create(title: "Good for one thing", rating: 1, review: "I hated the book but it made a good fire", user_id: @user_1.id)
@review_22 = @book_8.reviews.create(title: "I don't know what to think", rating: 3, review: "This book asked so many questions and left me with no answers", user_id: @user_2.id)
@review_23 = @book_1.reviews.create(title: "What?", rating: 3, review: "I can't tell if this book is good or not", user_id: @user_5.id)
@review_24 = @book_1.reviews.create(title: "Interesting?", rating: 3, review: "I think this book was good but also I don't know so maybe it wasn't?", user_id: @user_4.id)
@review_1 = @book_2.reviews.create(title: "Dang", rating: 2, review: "I left my lunch at home. WHOOPS, wrong forum for this.", user_id: @user_3.id)
@review_1 = @book_3.reviews.create(title: "Not bad", rating: 3, review: "Also not good. But that might be because I was trying to read it while driving and crashed my car.", user_id: @user_1.id)
@review_1 = @book_4.reviews.create(title: "Not my strong suit", rating: 2, review: "I'm more the street smart type so this was an experiment that went wrong, but I'm glad for the experience.", user_id: @user_2.id)
@review_1 = @book_5.reviews.create(title: "$W337", rating: 5, review: "L337 B00K", user_id: @user_3.id)
@review_1 = @book_6.reviews.create(title: "This book.", rating: 5, review: " This book changed my life, but only because time passed while I read it so even this review is changing my life. Oof, I need to sit down.", user_id: @user_4.id)
@review_1 = @book_7.reviews.create(title: "OK", rating: 3, review: "I SAID IT WAS OKAY WHAT MORE DO YOU WANT FROM ME? Sorry, I didn't realize caps lock was on and I don't feel like retyping all of that.", user_id: @user_5.id)
