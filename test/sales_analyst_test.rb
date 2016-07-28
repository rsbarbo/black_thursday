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

  def test_items_counter_by_merchant
    assert_equal [2,4,6,1,8], sa.items_counter_by_merchant
  end

  def test_it_can_count_all_items
    assert_equal 21, sa.items_qty
    # assert_equal 21, sa.items_counter_by_merchant.count
  end

  # items_collector
  #   ==> [a,b,c]
  #
  # items_counter
  #   ==> items_collector.count
  #


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
