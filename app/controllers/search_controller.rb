class SearchController < ApplicationController
  def index
    response = HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{params[:q]},25))?format=json&show=longName,storeType,phone,city,distance,&apiKey=#{ENV['api_key']}&pageSize=10")
    stores = JSON.parse(response.body)['stores']
    @results = stores.each do |store|
      Store.new(store)
    end
    byebug
  end
end
