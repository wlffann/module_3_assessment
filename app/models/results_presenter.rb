class ResultsPresenter
  attr_reader :total, :stores, :total_pages
  def initialize(total, stores, pages)
    @total = total
    @stores = stores.map do |store|
      Store.new(store)
    end
    @total_pages = pages
  end
end
