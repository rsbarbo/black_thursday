require "./lib/invoice_repo"
require "./test_helper"


class InvoiceRepoTest < Minitest::Test

  def test_returns_all_items
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 200, invoice_repo.all_invoices.length
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

end
