class BestBuyService
  include HTTParty
  base_uri 'api.bestbuy.com/v1'
  
  def initialize(zipcode)
    @options = { query: { format: 'json', show: 'longName,storeType,phone,city,distance', apiKey: ENV['api_key'], pageSize: 10 } }
    @zipcode = zipcode
  end

  def find_by_zipcode
    self.class.get "/stores(area(#{@zipcode},25))", @options
  end

  def next_page
    @options[:page] = 2
    self.class.get "/stores(area(#{@zipcode},25))", @options
  end
end
