require_relative '../test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :input

  def setup
    @input = {:items=>"./test/support/items_test.csv",
              :merchants=>"./test/support/merchants_test.csv",
              :invoices=>"./test/support/invoices_test.csv",
              :invoice_items=>"./test/support/invoice_items_test.csv",
              :transactions=>"./test/support/transactions_test.csv"}
  end

  def test_sales_engine_has_access_to_item_repo_class
    assert_equal(ItemRepo, SalesEngine.new(input).items.class)
  end

  def test_sales_engine_has_access_to_merchant_repo_class
    assert_equal(MerchantRepo, SalesEngine.new(input).merchants.class)
  end

  def test_sales_engine_has_access_to_invoice_repo_class
    assert_equal(InvoiceRepo, SalesEngine.new(input).invoices.class)
  end

  def test_sales_engine_has_access_to_invoice_items_repo_class
    assert_equal(InvoiceItemRepo, SalesEngine.new(input).invoice_items.class)
  end


end
