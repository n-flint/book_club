require 'rails_helper'

RSpec.describe 'when visitor visits book index', type: :feature do

  before :each do
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
    @books = Book.all

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
  end

  it 'can see all books' do

    visit books_path

    expect(page).to have_content("Books")
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content("Peregrine")
    expect(page).to have_content(@book_1.pages)
    expect(page).to have_content(@book_1.published)
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")

    expect(page).to have_content(@book_2.title)
    expect(page).to have_content("Noah")
    expect(page).to have_content(@book_2.pages)
    expect(page).to have_content(@book_2.published)
    expect(page).to have_css("img[src*='https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg']")
  end

  xit 'sees a nav bar' do

    visit books_path

    expect(page).to have_link("Add Book")
  end

  it 'sees stats section for 3 highest and lowest books and users with most reviews' do

    visit books_path

    within '#best-books' do
      expect(page).to have_content("3 Highest Rated Books")
      expect(page).to have_content("Title: #{@books.best.first.title}")
      expect(page).to have_content("Rating: #{@books.best.first.average_score}")

      expect(page).to have_content("Title: #{@books.best.second.title}")
      expect(page).to have_content("Rating: #{@books.best.second.average_score}")

      expect(page).to have_content("Title: #{@books.best.third.title}")
      expect(page).to have_content("Rating: #{@books.best.third.average_score}")
    end

    within '#worst-books' do
      expect(page).to have_content("3 Lowest Rated Books")
      expect(page).to have_content("Title: #{@books.worst.first.title}")
      expect(page).to have_content("Rating: #{@books.worst.average_score}")

      expect(page).to have_content("Title: #{@books.worst.second.title}")
      expect(page).to have_content("Rating: #{@books.worst.average_score}")

      expect(page).to have_content("Title: #{@books.worst.third.title}")
      expect(page).to have_content("Rating: #{@books.worst.average_score}")
    end

    within '#top-users' do
      expect(page).to have_content("Most Reviews By:")
      expect(page).to have_content(@books.top_users.first.name)
      expect(page).to have_content("Review Count: #{@books.top_users.first.review_count}")

      expect(page).to have_content(@books.top_users.second.name)
      expect(page).to have_content("Review Count: #{@books.top_users.second.review_count}")

      expect(page).to have_content(@books.top_users.third.name)
      expect(page).to have_content("Review Count: #{@books.top_users.third.review_count}")
    end
  end

end
