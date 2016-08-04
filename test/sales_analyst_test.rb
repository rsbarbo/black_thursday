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
    assert_equal 2.88, sa.average_items_per_merchant
  end

  def test_items_collection_of_items_counts
    assert_instance_of Array, sa.collct_of_itms_cnts
  end

  def test_it_can_count_all_items
    assert_equal 475, sa.items_qty
  end

  def test_it_can_return_average_items_per_merchant_standard_deviation
    assert_equal 3.26, sa.average_items_per_merchant_standard_deviation
  end

  def test_deviation_calculator
    assert_equal 0.15, sa.merchant_deviation_calculator([1,2,3,4,5], 2.88)
  end

  def test_it_can_return_merchants_with_most_items_to_sell
    assert_equal 52, sa.merchants_with_high_item_count.count
  end

  def test_it_returns_the_average_price_of_merchants_items
    assert_equal 250.00, sa.average_item_price_for_merchant(12336622)
  end

  def test_average_average_price_per_merchant
    assert_equal 350.29, sa.average_average_price_per_merchant
  end

  def test_return_golden_items
    assert_equal 5, sa.golden_items.count
  end

  def test_returns_number_of_avg_invoices_per_merchant
    assert_equal 10.49, sa.average_invoices_per_merchant
  end

  def test_it_returns_avg_invoices_per_merchant_std_dev
    assert_equal 3.29, sa.average_invoices_per_merchant_standard_deviation
  end

  def test_it_returns_top_merchants_by_invoice_count
    assert_equal 12, sa.top_merchants_by_invoice_count.count
  end

  def test_it_can_return_lowest_merchants_by_inv_count
    assert_equal 4, sa.bottom_merchants_by_invoice_count.count
  end

  def test_it_returns_invoice_count_per_day
    expected = {"Saturday"=>729, "Friday"=>701, "Wednesday"=>741, "Monday"=>696, "Sunday"=>708, "Tuesday"=>692, "Thursday"=>718}
    assert_equal expected, sa.formatting_inv_cnt_per_day
  end

  def test_it_returns_top_day_deviation
    assert_equal 18.07, sa.top_day_deviation_calculator
  end

  def test_it_returns_top_days_by_inv_count
    assert_equal ["Wednesday"], sa.top_days_by_invoice_count
  end

  def test_return_percentage_of_invoice_based_on_status
    assert_equal 29.55, sa.invoice_status(:pending)
    assert_equal 56.95, sa.invoice_status(:shipped)
    assert_equal 13.50, sa.invoice_status(:returned)
  end

  def test_return_total_revenue_by_date
    date = Time.parse("2009-02-07")
    assert_equal 21067.77, sa.total_revenue_by_date(date)
    assert_instance_of BigDecimal, sa.total_revenue_by_date(date)
  end

  def test_it_returns_top_revenue_earners
    assert_equal 12334634, sa.top_revenue_earners(10).first.id
    assert_instance_of Merchant, sa.top_revenue_earners(10).first
  end

  def test_it_returns_merchant_pending_invoices
    assert_equal 467, sa.merchants_with_pending_invoices.count
  end

  def test_it_returns_merchants_with_only_one_item
    assert_equal 243, sa.merchants_with_only_one_item.length
    assert_instance_of Merchant, sa.merchants_with_only_one_item.first
  end

  def test_it_returns_merchants_with_only_one_item_registered_in_month
    assert_equal 18, sa.merchants_with_only_one_item_registered_in_month("July").count
  end

  def test_returns_revenue_by_merchant
    assert_equal 12052.47, sa.revenue_by_merchant(12336050)
  end

  def test_returns_most_sold_item_for_merchant
     assert_equal 1, sa.most_sold_item_for_merchant(12336050).count
  end

  def test_it_returns_most_sold_item_for_merchant
    assert_equal 1, sa.most_sold_item_for_merchant(12336622).count
  end
  
  def test_it_returns_best_item_for_merchant
    assert_instance_of Item, sa.best_item_for_merchant(12336622)
  end

end
