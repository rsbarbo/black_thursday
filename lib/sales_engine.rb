require "./lib/item_repo"

class SalesEngine
  attr_reader :item_repo

  def initialize(input)
    @item_repo = ItemRepo.new(input[:items])
    #@merchand = MerchantRepo.new(input[:merchand])
  end

  def self.from_csv(input)
    self.new(input)
  end

end

if __FILE__ == $0
  se = SalesEngine.from_csv({:items => "./data/items.csv"})
  p se.item_repo.find_by_id(263395237)
end
