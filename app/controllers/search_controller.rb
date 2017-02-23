class SearchController < ApplicationController
  def index
    response = HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{params[:q]},25))?format=json&show=longName,storeType,phone,city,distance,&apiKey=#{ENV['api_key']}&pageSize=10")
    results_hash = JSON.parse(response.body) 
    stores = results_hash['stores']
    total = results_hash['total']
    @results = ResultsPresenter.new(total, stores)
  end
end
