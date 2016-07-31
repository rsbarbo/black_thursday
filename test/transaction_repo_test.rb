require "csv"
require "./test_helper"
require_relative "../lib/invoice_item_repo"
require_relative '../lib/sales_engine'

class TransactionRepoTest < Minitest::Test

  def setup
    @se = SalesEngine.from_csv({:items=>"./test/support/items_test.csv",
                                :merchants=>"./test/support/merchants_test.csv",
                                :invoices=>"./test/support/invoices_test.csv",
                                :invoice_items=>"./test/support/invoice_items_test.csv",
                                :transactions=>"./test/support/transactions_test.csv",
                                :customers=>"./test/support/customers_test.csv"})
  end

  def test_it_returns_all_known_transaction_instances
    assert_equal 199, @se.transactions.all.length
  end

  def test_it_returns_all_transactions_by_transaction_id
    assert_equal 2179, @se.transactions.find_by_id(1).invoice_id
    assert_equal 4068631943231473, @se.transactions.find_by_id(1).credit_card_number
    assert_equal "0217", @se.transactions.find_by_id(1).credit_card_expiration_date
    assert_equal "success", @se.transactions.find_by_id(1).result
  end

  def test_it_can_return_all_transactions_by_invoice_id
    assert_equal 1, @se.transactions.find_all_by_invoice_id(2179).length
  end

  def test_it_returns_all_transactions_by_cc_number
    assert_equal 1, @se.transactions.find_all_by_credit_card_number(4068631943231473).length
  end

  def test_it_returns_all_transactions_by_result
    assert_equal 161, @se.transactions.find_all_by_result("success").length
    assert_equal 38, @se.transactions.find_all_by_result("failed").length
  end
end
