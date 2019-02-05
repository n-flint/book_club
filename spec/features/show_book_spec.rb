require 'rails_helper'

RSpec.describe 'when visitor visits show book', type: :feature do

  before :each do
    @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    @cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
    @book_1 = Book.create(title: "100 Pictures Of Spiders", pages: 100, published: 2000, cover: @cover_1)
    @book_1.authors.create(name: "Peregrine")
    @book_3 = Book.create(title: "Killing Time", pages: 105, published: 1992, cover: @cover_1)
    @book_3.authors.create(name: "Peregrine")
    @book_4 = Book.create(title: "Testing Books", pages: 200, published: 2010, cover: @cover_1)
    @book_4.authors.create(name: "Peregrine")
    @book_5 = Book.create(title: "What's UP? You Know, You Know", pages: 1, published: 2019, cover: @cover_1)
    @book_5.authors.create(name: "Peregrine")

    @user_1 = User.create(name: "Tim Allen")
    @user_2 = User.create(name: "Scott Thomas")
    @review_1 = @book_1.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
    @review_2 = @book_1.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 4, review: "Good good")
    @review_4 = @book_1.reviews.create(title: "Kinda sorta", user_id: @user_1.id, rating: 3, review: "Eh")
    @review_5 = @book_1.reviews.create(title: "An OKish Read", user_id: @user_2.id, rating: 2, review: "Probably leave it")
    @review_6 = @book_1.reviews.create(title: "BOO", user_id: @user_1.id, rating: 1, review: "I died inside")
    @review_7 = @book_1.reviews.create(title: "Awful", user_id: @user_2.id, rating: 1, review: "Leave it!")

    @book_2 = Book.create(title: "What's New Pussy Cat", pages: 200, published: 1999, cover: @cover_2)
    @book_2.authors.create(name: "Noah")
    @review_3 = @book_2.reviews.create(title: "New Favorite book ever", user_id: @user_1.id, rating: 5, review: "A tour de force")
  end

  it 'can see a single book' do

    visit book_path(@book_1)

    expect(page).to have_content("#{@book_1.title}")
    expect(page).to have_content("Author(s): Peregrine")
    expect(page).to have_content("Page Count: #{@book_1.pages}")
    expect(page).to have_content("Publication Date: #{@book_1.published}")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")

    expect(page).to_not have_content("#{@book_2.title}")
    expect(page).to_not have_content("Author(s): Noah")
    expect(page).to_not have_content("Page Count: #{@book_2.pages}")
    expect(page).to_not have_content("Publication Date: #{@book_2.published}")
    expect(page).to_not have_css("img[src*='https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg']")
  end

  it 'can see a link to add a review' do

    visit book_path(@book_1)

    expect(page).to have_link("Add Review", href: new_book_review_path(@book_1))
    click_link("Add Review")
    expect(current_path).to eq(new_book_review_path(@book_1))
  end

  it 'lists all reviews for book on show page' do

    visit book_path(@book_1)

    expect(page).to have_content(@review_1.title)
    expect(page).to have_link(@user_1.name)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.review)

    expect(page).to have_content(@review_2.title)
    expect(page).to have_link(@user_2.name)
    expect(page).to have_content(@review_2.rating)
    expect(page).to have_content(@review_2.review)
  end

  it 'sees stats area with 3 highest/lowest rated and average rating' do

    visit book_path(@book_1)

    within '#best-reviews' do
      expect(page).to have_content("Best 3 Reviews")
      expect(page).to have_content("Title: #{@book_1.best_reviews.first.title}")
      expect(page).to have_content("Rating: #{@book_1.best_reviews.first.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.best_reviews.first.user.name}")

      expect(page).to have_content("Title: #{@book_1.best_reviews.second.title}")
      expect(page).to have_content("Rating: #{@book_1.best_reviews.second.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.best_reviews.second.user.name}")

      expect(page).to have_content("Title: #{@book_1.best_reviews.third.title}")
      expect(page).to have_content("Rating: #{@book_1.best_reviews.third.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.best_reviews.third.user.name}")
    end

    within '#worst-reviews' do
      expect(page).to have_content("Worst 3 Reviews")
      expect(page).to have_content("Title: #{@book_1.worst_reviews.first.title}")
      expect(page).to have_content("Rating: #{@book_1.worst_reviews.first.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.worst_reviews.first.user.name}")

      expect(page).to have_content("Title: #{@book_1.worst_reviews.second.title}")
      expect(page).to have_content("Rating: #{@book_1.worst_reviews.second.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.worst_reviews.second.user.name}")

      expect(page).to have_content("Title: #{@book_1.worst_reviews.third.title}")
      expect(page).to have_content("Rating: #{@book_1.worst_reviews.third.rating}")
      expect(page).to have_content("Reviewer: #{@book_1.worst_reviews.third.user.name}")
    end

    within '#average-review' do
      expect(page).to have_content("Average Review Score")
      expect(page).to have_content(@book_1.average_score)
    end

  end

  it 'sees a nav bar' do

    visit book_path(@book_1)

    expect(page).to have_link("Home")
    expect(page).to have_link("Browse Books")
    
  end
end
