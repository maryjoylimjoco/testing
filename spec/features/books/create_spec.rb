require 'rails_helper'

RSpec.feature 'User submits a book' do
  let!(:book) { FactoryGirl.build(:book) }

  scenario 'they see the page for the submitted book' do
    visit root_path
    click_on 'Add new book'

    fill_in 'book_title', with: book.title
    fill_in 'book_description', with: book.description
    fill_in 'book_price', with: 30_000
    click_button 'Create a Book'

    expect(page).to have_content 'Book has successfully been created.'
    expect(page).to have_content book.title
  end

  context 'the form is invalid' do
    scenario 'they see a useful error message' do
      visit root_path
      click_on 'Add new book'

      fill_in 'book_description', with: book.description
      fill_in 'book_price', with: 30_000
      click_button 'Create a Book'

      expect(page).to have_content "Title can't be blank"
    end
  end
end
