require 'rails_helper'

describe 'User searches for stores' do
  it 'using zip code' do
    visit root_path
    fill_in 'search', with: '80202'
    click_on "Search"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("16 total stores")
    expect(page).to have_css('store', count: 10)
    within('store:nth-of-type(1)') do
      expect(page).to have_content()
    end
  end
end
  
