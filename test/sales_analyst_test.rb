require_relative "../test_helper"
require_relative "../lib/sales_analyst"
require_relative '../test/test_supporter'

class SalesAnalystTest < Minitest::Test
  attr_reader :se, :sa

  def setup
    @se = Supporter.new.se
    @sa = SalesAnalyst.new(se)
  end

  def test_it_can_return_average_items_per_merchant
    assert_equal 2.67, sa.average_items_per_merchant
  end

  def test_items_collection_of_items_counts
    assert_equal [2, 1, 1], sa.collct_of_itms_cnts
  end

  def test_it_can_count_all_items
    assert_equal 3, sa.items_qty
  end

  def test_it_can_return_average_items_per_merchant_standard_deviation
    assert_equal 1.74, sa.average_items_per_merchant_standard_deviation
  end

  def test_deviation_calculator
    assert_equal 2.24, sa.merchant_deviation_calculator([1,2,3,4,5], 2.88)
  end

  def test_it_can_return_merchants_with_most_items_to_sell
    assert_equal 0, sa.merchants_with_high_item_count.count
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

  def test_it_can_return_lowest_merchants_by_inv_count
    assert_equal [], sa.bottom_merchants_by_invoice_count
  end

  def test_it_returns_invoice_count_per_day
    expected = {"Saturday"=>30, "Friday"=>35, "Wednesday"=>20, "Monday"=>26, "Sunday"=>33, "Tuesday"=>33, "Thursday"=>23}
    assert_equal expected, sa.formatting_inv_cnt_per_day
  end

  def test_it_returns_top_day_deviation
    assert_equal 5.72, sa.top_day_deviation_calculator
  end

  def test_it_returns_top_days_by_inv_count
    assert_equal ["Friday"], sa.top_days_by_invoice_count
  end

  def test_return_percentage_of_invoice_based_on_status
    assert_equal 29.00, sa.invoice_status(:pending)
    assert_equal 59.50, sa.invoice_status(:shipped)
    assert_equal 11.50, sa.invoice_status(:returned)
  end

  def test_return_total_revenue_by_date
    date = Time.parse("2009-02-07")
    assert_equal 21067.77, sa.total_revenue_by_date(date)
    assert_instance_of BigDecimal, sa.total_revenue_by_date(date)
  end

  def test_it_returns_top_revenue_earners
    assert_equal 3, sa.top_revenue_earners(10).length
  end

end
