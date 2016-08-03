require_relative "../lib/sales_engine"
require "pry"

class SalesAnalyst
  include SalesAnalystAssistant

  attr_reader :se, :avg_inv_per_day

  def initialize(sales_engine)
    @se = sales_engine
  end

  def average_items_per_merchant
    ((se.items.all.count)/(all_merchant.count.to_f)).round(2)
  end

  def average_items_per_merchant_standard_deviation
    avg_itm_p_mrchnt = average_items_per_merchant
    merchant_deviation_calculator(collct_of_itms_cnts, avg_itm_p_mrchnt)
  end

  def merchants_with_high_item_count
    high_count = average_items_per_merchant_standard_deviation +
    average_items_per_merchant
    all_merchant.find_all do |merchant|
      merchant.items.count > high_count
    end
  end

  def average_item_price_for_merchant(merchant_id)
    prc_per_unit = se.merchants.find_by_id(merchant_id).items.map(&:unit_price)
    pre_return = (prc_per_unit.reduce(:+)/prc_per_unit.size)
    pre_return.round(2)
  end

  def average_average_price_per_merchant
    sum_of_averages = all_merchant.reduce(0) do |sum, merchant|
      sum + average_item_price_for_merchant(merchant.id)
    end
    outcome = sum_of_averages / all_merchant.count
    outcome.floor(2)
  end

  def golden_items
    deviation = (average_item_price_standard_deviation * 2)
    golden_price = deviation + average_average_price_per_merchant
    all_items.find_all do |item|
      item.unit_price > golden_price
    end
  end

  def average_invoices_per_merchant
    ((all_invoices.count)/(all_merchant.count.to_f)).round(2)
  end

  def average_invoices_per_merchant_standard_deviation
    avg_inv_p_mrchnt = average_invoices_per_merchant
    invoice_deviation_calculator(collct_of_invs_cnts, avg_inv_p_mrchnt)
  end

  def top_merchants_by_invoice_count
    deviation = (average_invoices_per_merchant_standard_deviation * 2)
    high_inv_count = deviation + average_invoices_per_merchant
    all_merchant.find_all do |merchant|
      merchant.invoices.count > high_inv_count
    end
  end

  def bottom_merchants_by_invoice_count
    deviation = (average_invoices_per_merchant_standard_deviation * 2)
    lower_inv_count = average_invoices_per_merchant - deviation
    all_merchant.find_all do |merchant|
      merchant.invoices.count < lower_inv_count
    end
  end

  def top_days_by_invoice_count
    deviation = top_day_deviation_calculator
    most_selling_day = formatting_inv_cnt_per_day.find_all do |wkday, count|
      count > (deviation + avg_inv_per_day)
    end
    most_selling_day.map {|wkday, count| wkday}
  end

  def invoice_status(status)
    invoices = se.invoices.find_all_by_status(status)
    result = ((invoices.count.to_f)/(all_invoices.count))
    (result * 100).round(2)
  end

  def total_revenue_by_date(date)
    invoices = se.invoices.find_all_by_date(date)
    inv_ids = invoices.map {|invoice| invoice.id}
    finding_total_revenue_by_date(invoices, inv_ids)
  end

  def merchants_ranked_by_revenue
    all_merchant.sort_by do |merchant|
      merchant.revenue
    end.reverse
  end

  def top_revenue_earners(number = 20)
    merchants_ranked_by_revenue[0..number - 1]
  end

  def merchants_with_pending_invoices
    all_merchant.find_all { |merchant| merchant.are_invoices_pending?}
  end

  def merchants_with_only_one_item
    all_merchant.find_all do |merchant|
      merchant.items.count == 1
    end
  end

  def merchants_with_only_one_item_registered_in_month(month)
    merchants_with_only_one_item.find_all do |merchant|
      merchant.created_at.strftime("%B").downcase == month
      merchant.items.count == 1
    end
  end

  def revenue_by_merchant(merch_id)
    merchant = all_merchant.map {|mer| mer.merchant_repo.find_by_id(merch_id)}
    merchant.map do |merch|
      merch.revenue
    end.max
  end

end
