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

end
