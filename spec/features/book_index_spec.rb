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
    @book_4 = Book.create(title: "Testing Books", pages: 201, published: 2010, cover: @cover_1)
    @book_4.authors.create(name: "Peregrine")
    @book_5 = Book.create(title: "What's UP? You Know, You Know", pages: 2, published: 2019, cover: @cover_1)
    @book_5.authors.create(name: "Peregrine")
    @books = Book.all

    @user_1 = User.create(name: "Tim Allen")
    @user_2 = User.create(name: "Scott Thomas")
    @user_3 = User.create(name: "Noah Flint")
    @user_4 = User.create(name: "Peregrine Balas")
    @user_5 = User.create(name: "Peter Lapicola")
    @user_6 = User.create(name: "Ian Douglas")
    @user_7 = User.create(name: "Megan McMahon")
    @top_users = User.most_reviews

    @review_1 = @book_1.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
    @review_2 = @book_1.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 4, review: "Good good")
    @review_3 = @book_2.reviews.create(title: "New Favorite book ever", user_id: @user_3.id, rating: 5, review: "A tour de force")
    @review_4 = @book_2.reviews.create(title: "Kinda sorta", user_id: @user_4.id, rating: 3, review: "Eh")
    @review_5 = @book_3.reviews.create(title: "An OKish Read", user_id: @user_5.id, rating: 2, review: "Probably leave it")
    @review_6 = @book_1.reviews.create(title: "BOO", user_id: @user_6.id, rating: 1, review: "I died inside")
    @review_7 = @book_1.reviews.create(title: "Awful", user_id: @user_7.id, rating: 1, review: "Leave it!")
    @review_8 = @book_3.reviews.create(title: "Best book ever", user_id: @user_1.id, rating: 5, review: "A must read")
    @review_9 = @book_3.reviews.create(title: "Goody bookie", user_id: @user_2.id, rating: 5, review: "Good good")
    @review_10 = @book_4.reviews.create(title: "Kinda sorta", user_id: @user_1.id, rating: 3, review: "Eh")
    @review_11 = @book_5.reviews.create(title: "An OKish Read", user_id: @user_2.id, rating: 2, review: "Probably leave it")
    @review_12 = @book_5.reviews.create(title: "BOO", user_id: @user_1.id, rating: 4, review: "I died inside")
    @review_13 = @book_5.reviews.create(title: "Awful", user_id: @user_2.id, rating: 4, review: "Leave it!")
    @review_14 = @book_5.reviews.create(title: "Awesome", user_id: @user_2.id, rating: 5, review: "Love it!")
    @review_14 = @book_1.reviews.create(title: "Awe Inspiring", user_id: @user_2.id, rating: 5, review: "Love it!")

    @book_1.update(average_rating: @book_1.average_score)
    @book_2.update(average_rating: @book_2.average_score)
    @book_3.update(average_rating: @book_3.average_score)
    @book_4.update(average_rating: @book_4.average_score)
    @book_5.update(average_rating: @book_5.average_score)

  end

  it 'can see all books' do

    visit books_path

    expect(page).to have_content("Books")
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.authors.first.name)
    expect(page).to have_content(@book_1.pages)
    expect(page).to have_content(@book_1.published)
    expect(page).to have_css("img[src*='#{@book_1.cover}']")

    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(@book_2.authors.first.name)
    expect(page).to have_content(@book_2.pages)
    expect(page).to have_content(@book_2.published)
    expect(page).to have_css("img[src*='#{@book_2.cover}']")
  end

  it 'sees a nav bar' do

    visit books_path

    expect(page).to have_link("Home")
    expect(page).to have_link("Add Book")
  end
  it 'goes to the add book page when link is pressed' do

    visit books_path

    click_link("Add Book")

    expect(current_path).to eq(new_book_path)

  end

  it 'goes to the home book page when link is pressed' do

    visit books_path

    click_link("Home")

    expect(current_path).to eq(root_path)

  end

  it 'sees stats section for 3 highest and lowest books and users with most reviews' do

    visit books_path

    within '#best-books' do
      expect(page).to have_content("Highest Rated Books")
      expect(page).to have_content(@books.best.first.title)
      expect(page).to have_content("Rating: #{@books.best.first.average_score}")

      expect(page).to have_content(@books.best.second.title)
      expect(page).to have_content("Rating: #{@books.best.second.average_score}")

      expect(page).to have_content(@books.best.third.title)
      expect(page).to have_content("Rating: #{@books.best.third.average_score}")
    end

    within '#worst-books' do
      expect(page).to have_content("Lowest Rated Books")
      expect(page).to have_content(@books.worst.first.title)
      expect(page).to have_content("Rating: #{@books.worst.first.average_score}")

      expect(page).to have_content(@books.worst.second.title)
      expect(page).to have_content("Rating: #{@books.worst.second.average_score}")

      expect(page).to have_content(@books.worst.third.title)
      expect(page).to have_content("Rating: #{@books.worst.third.average_score}")
    end

    within '#top-users' do
      expect(page).to have_content("Most Reviews By:")
      expect(page).to have_content(@top_users.first.name)
      expect(page).to have_content("Review Count: #{@top_users.first.review_count}")

      expect(page).to have_content(@top_users.second.name)
      expect(page).to have_content("Review Count: #{@top_users.second.review_count}")

      expect(page).to have_content(@top_users.third.name)
      expect(page).to have_content("Review Count: #{@top_users.third.review_count}")
    end
  end

  it 'sees a count and an average for reviews for each book' do

    visit books_path

    within "#book-#{@book_1.id}" do
      within ".book-info" do
        expect(page).to have_content("Average Rating: #{@book_1.average_score}")
        expect(page).to have_content("Review Count: #{@book_1.review_count}")

        expect(page).to_not have_content("Average Rating: #{@book_2.average_score}")
      end
    end

    within "#book-#{@book_2.id}" do
      within ".book-info" do
        expect(page).to have_content("Average Rating: #{@book_2.average_score}")
        expect(page).to have_content("Review Count: #{@book_2.review_count}")

        expect(page).to_not have_content("Average Rating: #{@book_1.average_score}")
      end
    end

  end

  it 'sees links to sort books' do

    visit books_path

    within ".sort-styles" do
      expect(page).to have_content("Sort By:")
      expect(page).to have_link('high to low ratings')
      expect(page).to have_link('low to high ratings')
      expect(page).to have_link('most pages')
      expect(page).to have_link('fewest pages')
      expect(page).to have_link('most reviews')
      expect(page).to have_link('least reviews')
    end

  end

  it 'sorts books when clicking links to sort' do

    visit books_path

    click_link('high to low ratings')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[1]).to have_content("Killing Time")
      expect(page.all('.book')[2]).to have_content("What's UP? You Know, You Know")
      expect(page.all('.book')[3]).to have_content("100 Pictures Of Spiders")
      expect(page.all('.book')[4]).to have_content("Testing Books")
    end

    click_link('low to high ratings')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("Testing Books")
      expect(page.all('.book')[1]).to have_content("100 Pictures Of Spiders")
      expect(page.all('.book')[2]).to have_content("What's UP? You Know, You Know")
      expect(page.all('.book')[3]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[4]).to have_content("Killing Time")
    end

    click_link('most pages')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("Testing Books")
      expect(page.all('.book')[1]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[2]).to have_content("Killing Time")
      expect(page.all('.book')[3]).to have_content("100 Pictures Of Spiders")
      expect(page.all('.book')[4]).to have_content("What's UP? You Know, You Know")
    end

    click_link('fewest pages')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("What's UP? You Know, You Know")
      expect(page.all('.book')[1]).to have_content("100 Pictures Of Spiders")
      expect(page.all('.book')[2]).to have_content("Killing Time")
      expect(page.all('.book')[3]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[4]).to have_content("Testing Books")
    end

    click_link('most reviews')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("100 Pictures Of Spiders")
      expect(page.all('.book')[1]).to have_content("What's UP? You Know, You Know")
      expect(page.all('.book')[2]).to have_content("Killing Time")
      expect(page.all('.book')[3]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[4]).to have_content("Testing Books")
    end

    click_link('least reviews')

    within ".books" do
      expect(page.all('.book')[0]).to have_content("Testing Books")
      expect(page.all('.book')[1]).to have_content("What's New Pussy Cat")
      expect(page.all('.book')[2]).to have_content("Killing Time")
      expect(page.all('.book')[3]).to have_content("What's UP? You Know, You Know")
      expect(page.all('.book')[4]).to have_content("100 Pictures Of Spiders")
    end
  end

end
