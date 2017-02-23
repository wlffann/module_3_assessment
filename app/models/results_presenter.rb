class ResultsPresenter
  attr_reader :total, :stores
  def initialize(total, stores)
    @total = total
    @stores = stores.map do |store|
      Store.new(store)
    end
  end
end
