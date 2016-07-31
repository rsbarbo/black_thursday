require "csv"
require "./test_helper"
require_relative "../lib/invoice_item_repo"
require_relative '../lib/sales_engine'

class InvoiceItemRepoTest < Minitest::Test
  attr_reader :se

  def setup
    @se = SalesEngine.from_csv({:items=>"./test/support/items_test.csv", :merchants=>"./test/support/merchants_test.csv",
      :invoices=>"./test/support/invoices_test.csv", :invoice_items=>"./test/support/invoice_items_test.csv"})
  end

end
