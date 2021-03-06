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

    expect(response.status).to be(204)
  end

  it 'POST /api/v1/items/:id' do
    params = { :item => {:name => "NewName", :description => "NewDescription" ,:image_url => "http://dmeszqrvxc7wa.cloudfront.net/images/product/new/medium/11821006.jpg" } } 
    post '/api/v1/items', params
    item = JSON.parse(response.body)

    expect(response.status).to be(201)
    expect(item['name']).to eq("NewName")
    expect(item['description']).to eq("NewDescription")
    expect(item['image_url']).to eq("http://dmeszqrvxc7wa.cloudfront.net/images/product/new/medium/11821006.jpg")
  end
end
