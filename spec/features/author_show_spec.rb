require 'rails_helper'

RSpec.describe 'when visitor visits author show page', type: :feature do

  before :each do
    @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    @book_1 = Book.create(title: "The Big Old Book", author: "Peregrine Balas, Noah Flint", pages: 5000, published: 1811, cover: @cover_1)
    @book_1.authors.create(name: "Peregrine Balas")
    @book_1.authors.create(name: "Noah Flint")
    @book_2 = @book_1.authors.last.books.create(title: "The Lil Yung Book", author: "Noah Flint", pages: 101, published: 2019, cover: @cover_1)
  end

  it 'should list all books by that author' do

    visit author_path(@book_2.authors.last)

    expect(page).to have_content("Noah Flint")

    within "#book-#{@book_1.id}" do
      expect(page).to have_link(@book_1.title)
      expect(page).to have_link(@book_1.authors.first)
      expect(page).to have_content("Publication Year: 1811")
      expect(page).to have_content("Page Count: 5000")
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_link(@book_2.title)
      expect(page).to_not have_link(@book_1.authors.first)
      expect(page).to have_content("Publication Year: 2019")
      expect(page).to have_content("Page Count: 101")
    end

  end

end
