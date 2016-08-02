require "csv"
require "./test_helper"
require_relative '../test/test_supporter'
require_relative "../lib/invoice_repo"
require_relative '../lib/sales_engine'

class InvoiceRepoTest < Minitest::Test
  attr_reader :se

  def setup
    @se = Supporter.new.se
  end

  def test_returns_all
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 200, invoice_repo.all.length
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

  def test_return_invoice_merchant
    invoice = se.invoices.find_by_id(1)
    assert_equal nil, invoice.merchant
  end

  def test_it_can_get_all_items_on_a_particular_invoice
    invoice = se.invoices.find_by_id(7)
    assert_equal 4, invoice.items.length
  end

  def test_it_can_get_all_items_on_a_particular_invoice_by_item_id
    invoice = se.invoices.find_by_id(7)
    itms_id = [263446647, 263426763, 263445611, 263556622]
    assert_equal 4, invoice.invoice_repo.collect_items_based_on_itm_ids(itms_id).length
  end

  def test_it_can_get_transaction_from_invoice_id
    invoice = se.invoices.find_by_id(7)
    assert_equal 0, invoice.transactions.length
  end

  def test_it_can_find_a_customer
    invoice = se.invoices.find_by_id(7)
    assert_equal "Joey", invoice.customer.first_name
    assert_equal "Ondricka", invoice.customer.last_name
  end

  def test_invoice_is_paid_in_full
    invoice = se.invoices.find_by_id(7)
    assert_equal false, invoice.is_paid_in_full?
  end

end
