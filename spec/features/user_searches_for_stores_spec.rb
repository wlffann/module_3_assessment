require 'rails_helper'

describe 'User searches for stores' do
  it 'using zip code' do
    VCR.use_cassette('search') do
      visit root_path
      fill_in 'q', with: '80202'
      click_on "Search"
      
      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 total stores")
      expect(page).to have_selector('.store', count: 10)
      within('.store:nth-of-type(1)') do
        expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(page).to have_content("Mobile SAS")
        expect(page).to have_content("303-270-9189")
        expect(page).to have_content("DENVER")
        expect(page).to have_content("3.45")
      end
    end
  end
  
  it 'they can see the second page' do
    visit root_path
    fill_in 'q', with: '80202'
    click_on "Search"
    click_on "2"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("16 total stores")
    expect(page).to have_selector('.store', count: 6)
    within('.store:nth-of-type(1)') do
      expect(page).to have_content("BEST BUY - I70 & TOWER RD")
      expect(page).to have_content("Big Box")
      expect(page).to have_content("303-373-9284")
      expect(page).to have_content("AURORA")
      expect(page).to have_content("11.65")
    end
  end
end
  
