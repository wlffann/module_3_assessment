require 'rails_helper'

describe 'User searches for stores' do
  it 'using zip code' do
    VCR.use_cassette('search') do
      visit root_path
      fill_in 'q', with: '80202'
      click_on "Search"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 total stores")
      expect(page).to have_css('store', count: 10)
      within('store:nth-of-type(1)') do
        expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(page).to have_content("Mobile SAS")
        expect(page).to have_content("303-270-9189")
        expect(page).to have_content("DENVER")
        expect(page).to have_content("3.45")
      end
    end
  end
end
  
