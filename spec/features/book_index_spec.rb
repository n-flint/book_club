require 'rails_helper'

describe 'when visitor visits book index', type: :feature do
  it 'can see all books' do
    cover = "https://cdn4.iconfinder.com/data/icons/basic-17/80/22_BO_open_book-512.png"
    book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000, cover: cover)
    book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999, cover: cover)

    visit books_path

    save_and_open_page

    expect(page).to have_content("Books")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.published)
    # expect(page).to have_xpath(book_1.cover)

    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.author)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_2.published)
    # expect(page).to have_xpath(book_2.cover)
  end
end
