require 'rails_helper'

RSpec.feature 'User views homepage' do
  scenario 'they see existing books' do
    book = create(:book)

    visit root_path

    expect(page).to have_link book.title, href: book_path(book)
  end
end
