require_relative "../test_helper"
require_relative "../lib/merchant_repo"
require_relative "../lib/sales_engine"
require "csv"

class MerchantRepoTest < Minitest::Test

  def test_returns_all_merchants
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 3, merchant_repo.all_merchants.length
  end

  def test_it_returns_values_when_searched_by_id
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal "rakimagery", merchant_repo.find_by_id(12336622).name
  end

  def test_it_returns_NIL_when_searched_by_id_is_invalid
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal nil, merchant_repo.find_by_id(1233416555)
  end

  def test_find_by_name_regardless_of_case
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 12336622, merchant_repo.find_by_name("rakimagery").id
    assert_equal 12336622, merchant_repo.find_by_name("rakiMagEry").id
  end

  def test_find_by_name_and_return_values
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 12336622, merchant_repo.find_by_name("rakimagery").id
  end

  def test_find_by_name_if_it_starts_with_number
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 12336622, merchant_repo.find_by_name("rakimagery").id
  end

  def test_find_all_by_name_without_fragment
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 0, merchant_repo.find_all_by_name("Blahblahblahblahblah").length
  end

  def test_find_all_by_name_with_fragment
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal 1, merchant_repo.find_all_by_name("Di").length
    assert_equal "DivineDesignCaroline", merchant_repo.find_all_by_name("Di").first.name
  end

  def test_find_all_by_name_return_empty_array_when_does_not_match
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv", nil)
    assert_equal [], merchant_repo.find_all_by_name("dsdsdsds")
  end

  def test_it_returns_items_based_on_id_given_to_merchant
    se = SalesEngine.from_csv({:items=>"./data/items.csv",
                                :merchants=>"./data/merchants.csv",
                                :invoices=>"./data/invoices.csv",
                                :invoice_items=>"./data/invoice_items.csv",
                                :transactions=>"./data/transactions.csv"})
    merchant = se.merchants.find_by_id(12336622)

    assert_instance_of Item, merchant.items.first
    assert_equal 3, merchant.items.count
  end

  def test_it_returns_invoices_based_on_id_given_to_merchant
    se = SalesEngine.from_csv({:items=>"./data/items.csv",
                                :merchants=>"./data/merchants.csv",
                                :invoices=>"./data/invoices.csv",
                                :invoice_items=>"./data/invoice_items.csv",
                                :transactions=>"./data/transactions.csv"})
    merchant = se.merchants.find_by_id(12336622)

    assert_instance_of Invoice, merchant.invoices.first
    assert_equal 7, merchant.invoices.count
  end

end
