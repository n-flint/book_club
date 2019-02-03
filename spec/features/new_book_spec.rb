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
    fill_in "book_author", with: "Tim Allen, Noah Flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    book = Book.all.first

    expect(current_path).to eq(book_path(book))
  end

  it 'titleizes author names' do

    visit new_book_path

    fill_in "book_title", with: "Dog Wizards"
    fill_in "book_author", with: "tim allen, noah flint"
    fill_in "book_pages", with: 320
    fill_in "book_published", with: 2019

    click_button "Add Book"

    #TODO change have_content to have_link
    expect(page).to have_content("Tim Allen")
    expect(page).to have_content("Noah Flint")
  end

end
