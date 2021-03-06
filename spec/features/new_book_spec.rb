require 'rails_helper'

RSpec.describe 'when visitor visits new book page', type: :feature do

  it 'sees a form to add a book' do

    visit new_book_path

    expect(page).to have_content("Title")
    expect(page).to have_content("Author(s)")
    expect(page).to have_content("Publication Year")
    expect(page).to have_content("Page Count")
    expect(page).to have_button("Add Book")
  end

  it 'redirects to book show page if form is saved' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "Tim Allen, Noah Flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019
    fill_in "book_cover", with: "https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg"

    click_button "Add Book"

    book = Book.all.first

    expect(current_path).to eq(book_path(book))
    expect(page).to have_css("img[src*='https://static.seibertron.com/images/toys/uploads/1542829964-unicron-retailer-incentive-nick-roache.jpg']")
  end

  it 'has default cover image if none are provided' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "Tim Allen, Noah Flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    book = Book.all.first

    expect(current_path).to eq(book_path(book))
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
  end

  it 'stays on page if form is without title' do

    visit new_book_path

    fill_in "book_authors", with: "Tim Allen, Noah Flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    expect(page).to have_content("Title")
    expect(page).to have_content("Author(s)")
    expect(page).to have_content("Publication Year")
    expect(page).to have_content("Page Count")
    expect(page).to have_button("Add Book")
  end

  it 'stays on page if form is without authors' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    expect(page).to have_content("Title")
    expect(page).to have_content("Author(s)")
    expect(page).to have_content("Publication Year")
    expect(page).to have_content("Page Count")
    expect(page).to have_button("Add Book")
  end

  it 'stays on page if form is without page count' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "Tim Allen, Noah Flint"
    fill_in "book_published", with: 2019

    click_button "Add Book"

    expect(page).to have_content("Title")
    expect(page).to have_content("Author(s)")
    expect(page).to have_content("Publication Year")
    expect(page).to have_content("Page Count")
    expect(page).to have_button("Add Book")
  end

  it 'stays on page if form is without publication date' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "Tim Allen, Noah Flint"
    fill_in "book_pages", with: 320

    click_button "Add Book"

    expect(page).to have_content("Title")
    expect(page).to have_content("Author(s)")
    expect(page).to have_content("Publication Year")
    expect(page).to have_content("Page Count")
    expect(page).to have_button("Add Book")
  end

  it 'titleizes author names' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "tim allen, noah flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    expect(page).to have_link("Tim Allen")
    expect(page).to have_link("Noah Flint")
  end

  it 'clicks author name link and goes to that authors show page' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_authors", with: "tim allen, noah flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    click_link("Tim Allen")

    author = Author.find_by(name: "Tim Allen")
    expect(current_path).to eq(author_path(author))
  end

  it 'sees a nav bar' do

    visit new_book_path

    expect(page).to have_link("Home")
    expect(page).to have_link("Browse Books")

  end

  it 'goes to the home book page when link is pressed' do

    visit new_book_path

    click_link("Home")

    expect(current_path).to eq(root_path)
  end

  it 'goes to the book index page when link is pressed' do

    visit new_book_path

    click_link("Browse Books")

    expect(current_path).to eq(books_path)
  end


end
