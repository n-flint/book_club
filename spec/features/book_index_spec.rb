require 'rails_helper'

describe 'when visitor visits book index', type: :feature do
  it 'can see all books' do
    cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
    book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000, cover: cover_1)
    book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999, cover: cover_2)

    visit books_path

    expect(page).to have_content("Books")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.published)
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")

    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.author)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_2.published)
    expect(page).to have_css("img[src*='https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg']")
  end
end
