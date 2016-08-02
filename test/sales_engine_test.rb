require_relative '../test_helper'
require_relative '../lib/sales_engine'
require_relative '../test/test_supporter'


class SalesEngineTest < Minitest::Test
    attr_reader :input

    def setup
      @input = Supporter.new.input
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

  def test_sales_engine_has_access_to_transaction_repo_class
    assert_equal(TransactionRepo, SalesEngine.new(input).transactions.class)
  end

  def test_sales_engine_has_access_to_customer_repo_class
    assert_equal(CustomerRepo, SalesEngine.new(input).customers.class)
  end

end
