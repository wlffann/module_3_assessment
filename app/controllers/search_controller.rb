class SearchController < ApplicationController
  def index
    results = HTTParty.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,storeType,phone,city,distance,&apiKey=#{ENV['api_key']}&pageSize=10")
  end
end
