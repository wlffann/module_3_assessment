class BestBuyService
  include HTTParty
  base_uri 'api.bestbuy.com/v1'

  def self.find_by_zipcode(zipcode)
    get("/stores(area(#{zipcode},25))?format=json&show=longName,storeType,phone,city,distance&apiKey=#{ENV['api_key']}&pageSize=10")   
  end

end
