# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@default_cover = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
@cover_1 = "https://images.penguinrandomhouse.com/cover/9780679645689"
@cover_2 = "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg"
@cover_3 = "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg"
@cover_4 = "https://images-na.ssl-images-amazon.com/images/I/51vv75oglyL._SX326_BO1,204,203,200_.jpg"
@cover_5 = "https://images-na.ssl-images-amazon.com/images/I/81vjde0JFHL.jpg"
@cover_6 = "https://images-na.ssl-images-amazon.com/images/I/41kUPvqlguL.jpg"
@cover_7 = "https://prodimage.images-bn.com/pimages/9780547928203_p0_v2_s550x406.jpg"
@cover_8 = "https://images-na.ssl-images-amazon.com/images/I/41KGl2FqeAL.jpg"
@cover_9 = "https://images-na.ssl-images-amazon.com/images/I/71IfUpZ8QXL.jpg"
@cover_10 = "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg"
@cover_11 = "https://images-na.ssl-images-amazon.com/images/I/51mug4WQPgL._SX327_BO1,204,203,200_.jpg"
@cover_12 = "https://images-na.ssl-images-amazon.com/images/I/811k9HNhaiL.jpg"

@book_1 = Book.create(title: "In Search Of Lost Time", pages: 4215, published: 1913, cover: @cover_1)
@book_1.authors.create(name: "Marcel Proust")

@book_2 = Book.create(title: "Don Quixote", pages: 928, published: 1605, cover: @cover_2)
@book_2.authors.create(name: "Miguel de Cervantes")

@book_3 = Book.create(title: "Ulysses", pages: 730, published: 1922, cover: @cover_3)
@book_3.authors.create(name: "James Joyce")

@book_4 = Book.create(title: "The Great Gatsby", pages: 180, published: 1925, cover: @cover_4)
@book_4.authors.create(name: " F. Scott Fitzgerald")

@book_5 = Book.create(title: "Moby Dick", pages: 752, published: 1851, cover: @cover_5)
@book_5.authors.create(name: "Herman Melville")

@book_6 = Book.create(title: "The Fellowship Of The Ring", pages: 423, published: 1954, cover: @cover_6)
@book_6.authors.create(name: "J. R. R. Tolkien")

@book_7 = Book.create(title: "The Two Towers", pages: 352, published: 1954, cover: @cover_7)
@book_7.authors.create(name: "J. R. R. Tolkien")

@book_8 = Book.create(title: "The Return Of The King", pages: 416, published: 1955, cover: @cover_8)
@book_8.authors.create(name: "J. R. R. Tolkien")

@book_9 = Book.create(title: "The Call Of The Wild", pages: 232, published: 1903, cover: @cover_9)
@book_9.authors.create(name: "Jack London")

@book_10 = Book.create(title: "The Talisman", pages: 921, published: 1984, cover: @cover_10)
@book_10.authors.create(name: "Peter Straub, Stephen King")

@book_11 = Book.create(title: "The Art Of Happiness: A Handbook For Living", pages: 207, published: 1998, cover: @cover_11)
@book_11.authors.create(name: "Dalai Lama, Howard C. Cutler")

@book_12 = Book.create(title: "Into The Wild", pages: 224, published: 1996, cover: @cover_12)
@book_12.authors.create(name: "Jon Krakauer")

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
