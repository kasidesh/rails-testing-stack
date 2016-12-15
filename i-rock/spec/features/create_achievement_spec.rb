require 'rails_helper'

feature 'create new achievement' do
  scenario 'create new achievement with valid data' do
    visit('/')
    click_on('New Achievement')

    fill_in('Title', with: 'Read a book')
    fill_in('Description', with: 'Excellent read')
    select('Public', from: 'Privacy')
    check('Featured achievement')
    atach_file('Cover image' , "#{Rails.root}/spec/features/cover_image.png")
    click_on('Create Achievement')

    expect(page).to have_content('Achievement has been created')
    expect(Achievement.last.title).to eq('Read a book')
  end
end
