class BestBuyService
  include HTTParty
  base_uri 'api.bestbuy.com/v1'
  
  def initialize
    @options = { query: { format: 'json', show: 'longName,storeType,phone,city,distance', apiKey: ENV['api_key'], pageSize: 10 } }
  end

  def find_by_zipcode(zipcode)
    self.class.get "/stores(area(#{zipcode},25))", @options
  end

end
