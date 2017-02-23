require 'rails_helper'

describe 'Items API' do
  it 'GET /api/v1/items' do
    get '/api/v1/items'
    
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(Item.all.count)
    expect(item[:id]).to eq(Item.first.id)
    expect(item[:name]).to eq(Item.first.name)
    expect(item[:description]).to eq(Item.first.description)
    expect(item[:image_url]).to eq(Item.first.image_url)
    expext(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end
end
