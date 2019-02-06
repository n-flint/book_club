require 'rails_helper'

RSpec.describe 'when visitor visits author show page', type: :feature do

  before :each do
    @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    @book_1 = Book.create(title: "The Big Old Book", pages: 5000, published: 1811, cover: @cover_1)
    @book_1.authors.create(name: "Peregrine Balas")
    @book_1.authors.create(name: "Noah Flint")
    @book_2 = @book_1.authors.last.books.create(title: "The Lil Yung Book", pages: 101, published: 2019, cover: @cover_1)

    @user_1 = create(:user)
    @user_2 = create(:user)

    @book_1_review_1 = create(:review, rating: 5, book_id: @book_1.id, user_id: @user_1.id)
    @book_1_review_2 = create(:review, rating: 4, book_id: @book_1.id, user_id: @user_2.id)
    @book_2_review_1 = create(:review, rating: 2, book_id: @book_2.id, user_id: @user_1.id)
    @book_2_review_2 = create(:review, rating: 5, book_id: @book_2.id, user_id: @user_2.id)
  end

  it 'should list all books by that author, each with that books top review' do

    visit author_path(@book_2.authors.last)

    expect(page).to have_content("Noah Flint")

    within "#book-#{@book_1.id}" do
      expect(page).to have_link(@book_1.title)
      expect(page).to have_link(@book_1.authors.first.name)
      expect(page).to have_content("Publication Year: #{@book_1.published}")
      expect(page).to have_content("Page Count: #{@book_1.pages}")
      expect(page).to have_content(@book_1_review_1.title)
      expect(page).to have_link(@book_1_review_1.user.name)
      expect(page).to have_content("Rating: #{@book_1_review_1.rating}")

      expect(page).to_not have_content(@book_1_review_2.title)
      expect(page).to_not have_link(@book_1_review_2.user.name)
      expect(page).to_not have_content("Rating: #{@book_1_review_2.rating}")
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_link(@book_2.title)
      expect(page).to have_content("Publication Year: #{@book_2.published}")
      expect(page).to have_content("Page Count: #{@book_2.pages}")
      expect(page).to have_content(@book_2_review_2.title)
      expect(page).to have_link(@book_2_review_2.user.name)
      expect(page).to have_content("Rating: #{@book_2_review_2.rating}")

      expect(page).to_not have_content(@book_2_review_1.title)
      expect(page).to_not have_link(@book_2_review_1.user.name)
      expect(page).to_not have_content("Rating: #{@book_2_review_1.rating}")
      expect(page).to_not have_link(@book_1.authors.first.name)
    end

  end

  it 'sees a nav bar' do

    visit author_path(@book_2.authors.first)

    expect(page).to have_link("Home")
    expect(page).to have_link("Browse Books")
  end

  it 'can delete an author' do

    visit author_path(@book_2.authors.last)

    expect(page).to have_button("Delete Author")    

    click_button "Delete Author"

    expect(current_path).to eq(books_path)
    expect(page).to_not have_content(@book_2.title)
  end
end
