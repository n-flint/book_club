require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:published)}
  end
end

describe 'when visitor visits book index', type: :feature do
  it 'can see all books' do
    book_1 = Book.create(title: "100 Pictures Of Spiders", author: "Peregrine", pages: 100, published: 2000)
    book_2 = Book.create(title: "What's New Pussy Cat", author: "Noah", pages: 200, published: 1999)

    visit '/books'

    expect(page).to have_content("Books")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_2.author)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_1.published)
    expect(page).to have_content(book_2.published)
    # expect(page).to have_xpath(book_1.cover)
    # expect(page).to have_xpath(book_2.cover)
  end
end
