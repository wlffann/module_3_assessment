class SearchController < ApplicationController
  def index
    response = BestBuyService.new(params[:q]).find_by_zipcode
    results_hash = JSON.parse(response.body) 
    @results = ResultsPresenter.new(results_hash['total'], results_hash['stores'], results_hash["totalPages"])
  end
end
