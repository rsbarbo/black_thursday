require_relative "../lib/item_repo"
require_relative "../lib/merchant_repo"

class SalesEngine
  attr_reader :items, :merchants

  def initialize(input)
    @items = ItemRepo.new(input[:items], self)
    @merchants = MerchantRepo.new(input[:merchants], self)
  end

  def self.from_csv(input)
    self.new(input)
  end

end

if __FILE__ == $0
  se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
  merchant = se.merchants.find_by_id(12334146)
  item = se.items.find_by_id(263395237)
end
