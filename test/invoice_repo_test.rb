require "csv"
require "./test_helper"
require_relative "../lib/invoice_repo"
require_relative '../lib/sales_engine'

class InvoiceRepoTest < Minitest::Test
    attr_reader :se

  def setup
    @se = SalesEngine.from_csv({:items=>"./test/support/items_test.csv",
                                :merchants=>"./test/support/merchants_test.csv",
                                :invoices=>"./test/support/invoices_test.csv",
                                :invoice_items=>"./test/support/invoice_items_test.csv",
                                :transactions=>"./test/support/transactions_test.csv"})
  end

  def test_returns_all
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 200, invoice_repo.all.length
  end

  def test_returns_all_items
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 200, invoice_repo.all_invoices.length
  end

  def test_returns_all_items
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 12335938, invoice_repo.find_by_id(1).merchant_id
  end

  def test_find_all_by_customer_id
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 8, invoice_repo.find_all_by_customer_id(1).length
    assert_equal 12335938, invoice_repo.find_all_by_customer_id(1).first.merchant_id
  end

  def test_find_all_by_customer_id_return_empty_array_when_does_not_match
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal [], invoice_repo.find_all_by_customer_id(00000000)
  end

  def test_find_all_by_merchant_id
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 2, invoice_repo.find_all_by_merchant_id(12335938).length
    assert_equal 1, invoice_repo.find_all_by_merchant_id(12335938).first.customer_id
  end

  def test_find_all_by_merchant_id_return_empty_array_when_does_not_match
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal [], invoice_repo.find_all_by_merchant_id(00000000)
  end

  def test_find_all_by_status
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 58, invoice_repo.find_all_by_status("pending").length
    assert_equal :pending, invoice_repo.find_all_by_status("pending").first.status
  end

  def test_find_all_by_status_return_empty_array_when_does_not_match
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal [], invoice_repo.find_all_by_status("outstanding")
  end

  def test_something
    invoice = se.invoices.find_by_id(1)
    assert_equal nil, invoice.merchant
  end

end
