require 'rails_helper'

RSpec.describe 'when visitor visits show book', type: :feature do

  before :each do
    @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    @cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
    @book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000, cover: @cover_1)
    @book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999, cover: @cover_2)
  end

  it 'can see a single book' do

    visit book_path(@book_1)

    save_and_open_page

    expect(page).to have_content("#{@book_1.title}")
    expect(page).to have_content("Author: #{@book_1.author}")
    expect(page).to have_content("Page Count: #{@book_1.pages}")
    expect(page).to have_content("Publication Date: #{@book_1.published}")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")

    expect(page).to_not have_content("#{@book_2.title}")
    expect(page).to_not have_content("Author: #{@book_2.author}")
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
end
