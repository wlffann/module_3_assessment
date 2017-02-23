class SearchController < ApplicationController
  def index
    response = BestBuyService.new.find_by_zipcode(params[:q]) 
    results_hash = JSON.parse(response.body) 
    @results = ResultsPresenter.new(results_hash['total'], results_hash['stores'])
  end
end
