require 'rails_helper'

RSpec.describe 'when a visitor visits the welcomepage', type: :feature do

  it 'has show books link and add book link on welcome page' do

    visit root_path

    expect(page).to have_content("Book Club")
    expect(page).to have_link("Add Book")
    expect(page).to have_link("All Books")
  end

  it 'goes to new book page when add book link is clicked' do

    visit root_path

    click_link("Add Book")
    
    expect(current_path).to eq(new_book_path)
  end
  it 'goes to book index page when all books link is clicked' do

    visit root_path

    click_link("All Books")
    expect(current_path).to eq(books_path)
  end


end
