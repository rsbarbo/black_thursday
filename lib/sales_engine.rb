require_relative "../lib/item_repo"
require_relative "../lib/merchant_repo"
require_relative "../lib/invoice_repo"
require_relative "../lib/invoice_item_repo"

class SalesEngine
  attr_reader :items, :merchants, :invoices, :invoice_items

  def initialize(input)
    @items = ItemRepo.new(input[:items], self)
    @merchants = MerchantRepo.new(input[:merchants], self)
    @invoices = InvoiceRepo.new(input[:invoices], self)
    @invoice_items = InvoiceItemRepo.new(input[:invoice_items], self)
  end

  def self.from_csv(input)
    self.new(input)
  end

end
