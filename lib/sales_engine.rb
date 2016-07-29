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
