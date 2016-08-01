require "csv"
require "./test_helper"
require_relative "../lib/customer_repo"
require_relative '../lib/sales_engine'

class CustomerRepoTest < Minitest::Test

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

end
