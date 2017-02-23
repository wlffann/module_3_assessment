class Store
  attr_reader :long_name, :type, :distance, :phone, :city

  def initialize(store_params)
    @long_name = store_params['longName']
    @type = store_params['storeType']
    @distance = store_params['distance']
    @phone = store_params['phone']
    @city = store_params['city']
  end
end
