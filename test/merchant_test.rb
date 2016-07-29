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
    se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv", :invoices => "./data/invoices.csv"})
    merchant = se.merchants.find_by_id(12334141)

    assert_instance_of Item, merchant.items.first
    assert_equal 1, merchant.items.count
  end

end
