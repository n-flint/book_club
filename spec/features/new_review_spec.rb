require 'rails_helper'

RSpec.describe 'when visitor visits new review', type: :feature do
  it 'can see a form to add a review for the book' do
    cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
    book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000, cover: cover_1)
    book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999, cover: cover_2)

    visit new_book_review_path(book_1)

    expect(page).to have_content("Add Review for #{book_1.title}")
  end

end
