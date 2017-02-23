require 'rails_helper'

describe 'Items API' do
  before do 
    create_list(:item, 5)
  end

  it 'GET /api/v1/items' do
    get '/api/v1/items'
    
    items = JSON.parse(response.body)
    item = items.first
    
    expect(response).to be_success
    expect(items.count).to eq(Item.all.count)
    expect(item['id']).to eq(Item.first.id)
    expect(item['name']).to eq(Item.first.name)
    expect(item['description']).to eq(Item.first.description)
    expect(item['image_url']).to eq(Item.first.image_url)
    expect(item).to_not have_key('created_at')
    expect(item).to_not have_key('updated_at')
  end

  it 'GET /api/v1/items/:id' do
    get '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(Item.first.id)
    expect(item['name']).to eq(Item.first.name)
    expect(item['description']).to eq(Item.first.description)
    expect(item['image_url']).to eq(Item.first.image_url)
    expect(item).to_not have_key('created_at')
    expect(item).to_not have_key('updated_at')
  end

  it 'DELETE /api/v1/items/:id' do
    delete '/api/v1/items/1'

    expect(response).to be(204)
  end
end
