require_relative "../test_helper"
require_relative "../lib/sales_analyst"

class SalesAnalystTest < Minitest::Test
  attr_reader :se, :sa

  def setup
    @se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
    @sa = SalesAnalyst.new(se)
  end

  def test_it_can_return_average_items_per_merchant
    assert_equal 2.88, sa.average_items_per_merchant
  end

  def test_items_counter
    assert_equal 475, sa.items_counter.count
  end

  def test_it_can_return_average_items_per_merchant_standard_deviation
    assert_equal 3.26, sa.average_items_per_merchant_standard_deviation
  end

  def test_deviation_calculator
    assert_equal 1.59, sa.deviation_calculator([1,2,3,4,5], 2.88)
  end

  def test_it_can_return_merchants_with_most_items_to_sell
    assert_equal 52, sa.merchants_with_high_item_count.count
  end

end
