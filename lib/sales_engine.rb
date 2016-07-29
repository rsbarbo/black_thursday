require_relative "../lib/item_repo"
require_relative "../lib/merchant_repo"
require_relative "../lib/invoice_repo"

class SalesEngine
  attr_reader :items, :merchants, :invoices

  def initialize(input)
    @items = ItemRepo.new(input[:items], self)
    @merchants = MerchantRepo.new(input[:merchants], self)
    @invoices = InvoiceRepo.new(input[:invoices], self)
  end

  def self.from_csv(input)
    self.new(input)
  end

end
