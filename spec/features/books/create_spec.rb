require 'rails_helper'

RSpec.feature 'User submits a book' do
  let(:book) { build :book }

  scenario 'they see the page for the submitted book' do
    visit root_path
    click_on 'Add new book'

    fill_in 'book_title', with: book.title
    fill_in 'book_description', with: book.description
    fill_in 'book_price', with: 30_000
    click 'Submit'

    expect(page).to have_content 'Book successfully created.'
    expect(page).to have_content book.title
  end
end
