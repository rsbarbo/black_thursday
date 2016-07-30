require_relative "../test_helper"
require_relative "../lib/sales_analyst"

class SalesAnalystTest < Minitest::Test
  attr_reader :se, :sa

  def setup
    @se = SalesEngine.from_csv({:items => "./test/support/items_test.csv", :merchants => "./test/support/merchants_test.csv", :invoices => "./test/support/invoices_test.csv"})
    @sa = SalesAnalyst.new(se)
  end

  def test_it_can_return_average_items_per_merchant
    assert_equal 1.33, sa.average_items_per_merchant
  end

  def test_items_collection_of_items_counts
    assert_equal [2, 1, 1], sa.collct_of_itms_cnts
  end

  def test_it_can_count_all_items
    assert_equal 3, sa.items_qty
  end

  def test_it_can_return_average_items_per_merchant_standard_deviation
    assert_equal 0.58, sa.average_items_per_merchant_standard_deviation
  end

  def test_deviation_calculator
    assert_equal 2.24, sa.merchant_deviation_calculator([1,2,3,4,5], 2.88)
  end

  def test_it_can_return_merchants_with_most_items_to_sell
    assert_equal 1, sa.merchants_with_high_item_count.count
  end

  def test_it_returns_the_average_price_of_merchants_items
    assert_equal 250.00, sa.average_item_price_for_merchant(12336622)
  end

  def test_average_average_price_per_merchant
    assert_equal 116.33, sa.average_average_price_per_merchant
  end

  def test_return_golden_items
    assert_equal [], sa.golden_items
  end

  def test_returns_number_of_avg_invoices_per_merchant
    assert_equal 66.67, sa.average_invoices_per_merchant
  end

  def test_it_returns_avg_invoices_per_merchant_std_dev
    assert_equal 81.65, sa.average_invoices_per_merchant_standard_deviation
  end

  def test_it_returns_top_merchants_by_invoice_count
    assert_equal [], sa.top_merchants_by_invoice_count
  end

end
