require "./test_helper"
require "./lib/merchant_repo"

class MerchantRepoTest < Minitest::Test


  def test_returns_all_merchants
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 98, merchant_repo.all_merchants.length
  end

  def test_it_returns_values_when_searched_by_id
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal "justemonsters", merchant_repo.find_by_id(12334165).name
  end

  def test_it_returns_NIL_when_searched_by_id_is_invalid
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal nil, merchant_repo.find_by_id(1233416555)
  end

  def test_find_by_name_regardless_of_case
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 12334165, merchant_repo.find_by_name("justemonsters").id
    assert_equal 12334165, merchant_repo.find_by_name("justemonsters").id
  end

  def test_find_by_name_and_return_values
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 12334165, merchant_repo.find_by_name("justemonsters").id
  end

  def test_find_by_name_if_it_starts_with_number
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 12334165, merchant_repo.find_by_name("justemonsters").id
  end

  def test_find_all_by_name_without_fragment
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 0, merchant_repo.find_all_by_name("Blahblahblahblahblah").length
  end

  def test_find_all_by_name_with_fragment
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal 14, merchant_repo.find_all_by_name("Ma").length
  end

  def test_find_all_by_name_return_empty_array_when_doesnt_match
    merchant_repo = MerchantRepo.new("./test/support/merchants_test.csv")
    assert_equal [], merchant_repo.find_all_by_name("dsdsdsds")
  end

end
