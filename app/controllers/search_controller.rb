class SearchController < ApplicationController
  def index
    response = BestBuyService.find_by_zipcode(params[:q]) 
    results_hash = JSON.parse(response.body) 
    stores = results_hash['stores']
    total = results_hash['total']
    @results = ResultsPresenter.new(total, stores)
  end
end
