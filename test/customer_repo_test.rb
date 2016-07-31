require "csv"
require "./test_helper"
require_relative "../lib/customer_repo"
require_relative '../lib/sales_engine'

class CustomerRepoTest < Minitest::Test

  def setup
    @se = SalesEngine.from_csv({:items=>"./test/support/items_test.csv",
                                :merchants=>"./test/support/merchants_test.csv",
                                :invoices=>"./test/support/invoices_test.csv",
                                :invoice_items=>"./test/support/invoice_items_test.csv",
                                :transactions=>"./test/support/transactions_test.csv",
                                :customers=>"./test/support/customers_test.csv"})
  end

  def test_returns_all
    customer_repo = CustomerRepo.new("./test/support/customers_test.csv", nil)
    assert_equal 99, customer_repo.all.length
  end

  def test_it_returns_all_customers_by_customer_id
    customer_repo = CustomerRepo.new("./test/support/customers_test.csv", nil)
    assert_equal "Joey", customer_repo.find_by_id(1).first_name
    assert_equal "Ondricka", customer_repo.find_by_id(1).last_name
  end

  def test_it_returns_all_customers_by_first_name
    customer_repo = CustomerRepo.new("./test/support/customers_test.csv", nil)
    assert_equal "Joey", customer_repo.find_all_by_first_name("Jo").first_name
  end

  def test_it_returns_all_customers_by_last_name
    customer_repo = CustomerRepo.new("./test/support/customers_test.csv", nil)
    assert_equal "Ondricka", customer_repo.find_all_by_last_name("Ond").last_name
  end

end
