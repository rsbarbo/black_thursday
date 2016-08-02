require "csv"
require "./test_helper"
require_relative "../lib/customer_repo"
require_relative '../lib/sales_engine'
require_relative '../test/test_supporter'

class CustomerRepoTest < Minitest::Test
  attr_reader :se

  def setup
    @se = Supporter.new.se
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
    assert_equal 3, customer_repo.find_all_by_first_name("Jo").length
  end

  def test_it_returns_all_customers_by_last_name
    customer_repo = CustomerRepo.new("./test/support/customers_test.csv", nil)
    assert_equal 1, customer_repo.find_all_by_last_name("Ond").length
  end

  def test_it_returns_all_merchants_by_customer_id
    customer = se.customers.find_by_id(7)
    assert_equal [], customer.merchants
  end

  def test_it_returns_all_merchants_by_customer_id
    customer = se.customers.find_by_id(7)
    assert_equal 1, customer.merchants.length
  end

end
