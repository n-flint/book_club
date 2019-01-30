require 'rails_helper'

RSpec.describe 'when visitor visits show book', type: :feature do
  it 'can see a single book' do
    book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000)
    book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999)

    visit book_path(book_1)

    expect(page).to have_content("#{book_1.title}")
    expect(page).to have_content("Author: #{book_1.author}")
    expect(page).to have_content("Page Count: #{book_1.pages}")
    expect(page).to have_content("Publication Date: #{book_1.published}")
    # expect(page).to have_xpath(book_1.cover)

    expect(page).to_not have_content("#{book_2.title}")
    expect(page).to_not have_content("Author: #{book_2.author}")
    expect(page).to_not have_content("Page Count: #{book_2.pages}")
    expect(page).to_not have_content("Publication Date: #{book_2.published}")
    # expect(page).to have_xpath(book_2.cover)
  end
end
