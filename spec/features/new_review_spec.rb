require 'rails_helper'

RSpec.describe 'when visitor visits new review', type: :feature do

  before :each do
    @cover_1 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    @cover_2 = "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"
    @book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000, cover: @cover_1)
    @book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999, cover: @cover_2)
  end

  it 'can see a form to add a review for the book' do

    visit new_book_review_path(@book_1)

    expect(page).to have_content("Add Review for #{@book_1.title}")
    expect(page).to have_content("Title")
    expect(page).to have_content("Username")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'stays on page if form is without a review' do

    visit new_book_review_path(@book_1)

    fill_in "review_title", with: "Best Book Ever"
    fill_in "review_user", with: "Tim Allen"
    fill_in "review_rating", with: 5

    click_button "Create Review"

    expect(page).to have_content("Add Review for #{@book_1.title}")
    expect(page).to have_content("Title")
    expect(page).to have_content("Username")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'stays on page if form is without a user' do

    visit new_book_review_path(@book_1)

    fill_in "review_title", with: "Best Book Ever"
    fill_in "review_rating", with: 5
    fill_in "review_review", with: "This is a must read. I loved every sentence!"

    click_button "Create Review"

    expect(page).to have_content("Add Review for #{@book_1.title}")
    expect(page).to have_content("Title")
    expect(page).to have_content("Username")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'stays on page if form is without a rating' do

    visit new_book_review_path(@book_1)

    fill_in "review_title", with: "Best Book Ever"
    fill_in "review_user", with: "Tim Allen"
    fill_in "review_review", with: "This is a must read. I loved every sentence!"

    click_button "Create Review"

    expect(page).to have_content("Add Review for #{@book_1.title}")
    expect(page).to have_content("Title")
    expect(page).to have_content("Username")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'stays on page if form is without a title' do

    visit new_book_review_path(@book_1)

    fill_in "review_review", with: "This is a must read. I loved every sentence!"
    fill_in "review_user", with: "Tim Allen"
    fill_in "review_rating", with: 5

    click_button "Create Review"

    expect(page).to have_content("Add Review for #{@book_1.title}")
    expect(page).to have_content("Title")
    expect(page).to have_content("Username")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'redirects to book show page if form is saved' do

    visit new_book_review_path(@book_1)

    fill_in "review_title", with: "Best Book Ever"
    fill_in "review_user", with: "Tim Allen"
    fill_in "review_rating", with: 5
    fill_in "review_review", with: "This is a must read. I loved every sentence!"

    click_button "Create Review"

    expect(current_path).to eq(book_path(@book_1))
  end

end
