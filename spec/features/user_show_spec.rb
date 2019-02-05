require 'rails_helper'

RSpec.describe 'when visitor visits user show page', type: :feature do

  it 'shows all users and reviews' do
    user_1 = create(:user)
    user_2 = create(:user)
    book_1 = create(:book)
    book_2 = create(:book)
    book_3 = create(:book)
    review_1 = create(:review, user_id: user_1.id, book_id: book_1.id)
    review_2 = create(:review, user_id: user_1.id, book_id: book_2.id)
    review_3 = create(:review, user_id: user_2.id, book_id: book_3.id)
  
    visit user_path

    expect_page_to have_content("Title: #{review_1.title}")
    expect_page_to have_content("#{review_1.review}")
    expect_page_to have_content("Rating: #{review_1.rating}")
    expect_page_to have_content("Book Title: #{review_1.book.title}")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
    # expect_page_to have_content(" #{review_1.book.cover}")
    expect_page_to have_content("Date Reviewed: #{review_1.created_at.to_date.to_s}")
  end



end
