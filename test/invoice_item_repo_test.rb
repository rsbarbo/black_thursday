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

  def test_it_returns_all_invoice_items
    assert_equal 200, @se.invoice_items.all.length
  end

  def test_it_returns_all_invoiced_by_item_id
    #returns nil because we have truncated test data
    assert_equal nil, @se.invoice_items.find_by_id(263454779)
  end

  def test_it_returns_all_items_by_item_id
    #this returns empty becuase we have truncated test data
    assert_equal [] , @se.invoice_items.find_all_by_item_id(263567292)
  end

  def test_it_returns_all_invoices_by_invoice_id
    assert_equal 5, @se.invoice_items.find_all_by_invoice_id(13).length
  end

end
