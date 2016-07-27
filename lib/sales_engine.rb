require "./lib/item_repo"
require "./lib/merchant_repo"
# require "pry"

class SalesEngine
  attr_reader :item_repo, :merchant_repo

  def initialize(input)
    @item_repo = ItemRepo.new(input[:items], self)
    @merchant_repo = MerchantRepo.new(input[:merchants], self)
  end

  def self.from_csv(input)
    self.new(input)
  end

end

if __FILE__ == $0
  se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
  # p se.item_repo.find_by_id(263395237)
  # binding.pry
end
