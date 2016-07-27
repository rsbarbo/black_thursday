require_relative "../test_helper"
require_relative "../lib/merchant"
require_relative "../lib/item"
require_relative "../lib/sales_engine"
require "csv"

class MerchantTest < Minitest::Test
  attr_reader :m

  def setup
    @m = Merchant.new({:id => 5, :name => "Turing School"}, nil)
  end

  def test_returns_id
    assert_equal 5, m.id
  end

  def test_returns_name
    assert_equal "Turing School", m.name
  end

  def test_it_returns_items_based_on_id_given_to_merchant
    se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
    merchant = se.merchants.find_by_id(12334141)

    id_result 				 = merchant.items[0].id
    name_result        = merchant.items[0].name
    unit_price_result  = merchant.items[0].unit_price.to_f
    merchant_id_result = merchant.items[0].merchant_id
    created_at_result  = merchant.items[0].created_at
    updated_at_result  = merchant.items[0].updated_at

    assert_equal 263395237, id_result
    assert_equal "510+ RealPush Icon Set", name_result
    assert_equal 1200.00, unit_price_result
    assert_equal 12334141, merchant_id_result
    assert_equal Time.parse("2016-01-11 09:34:06 UTC"), created_at_result
    assert_equal Time.parse("2007-06-04 21:35:10 UTC"), updated_at_result
  end

end
