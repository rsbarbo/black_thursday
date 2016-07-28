require_relative "../test_helper"
require_relative "../lib/sales_analyst"

class SalesAnalystTest < Minitest::Test
  attr_reader :se, :sa

  def setup
    @se = SalesEngine.from_csv({:items => "./test/support/items_test.csv", :merchants => "./test/support/merchants_test.csv"})
    @sa = SalesAnalyst.new(se)
  end

  def test_it_can_return_average_items_per_merchant
    assert_equal 1.33, sa.average_items_per_merchant
  end

  def test_items_collection_of_items_counts
    assert_equal [2, 1, 1], sa.collection_of_items_counts
  end

  def test_it_can_count_all_items
    assert_equal 3, sa.items_qty
  end

  def test_it_can_return_average_items_per_merchant_standard_deviation
    assert_equal 0.58, sa.average_items_per_merchant_standard_deviation
  end

  def test_deviation_calculator
    assert_equal 2.24, sa.deviation_calculator([1,2,3,4,5], 2.88)
  end

  def test_it_can_return_merchants_with_most_items_to_sell
    assert_equal 1, sa.merchants_with_high_item_count.count
  end

  def test_it_returns_the_average_price_of_merchants_items
    skip
    # returns a BigDecimal
    assert_equal "", sa.average_item_price_per_merchant
  end

end
