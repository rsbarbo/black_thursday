require_relative "../lib/sales_engine"

class SalesAnalyst
  attr_reader :se

  def initialize(sales_engine)
    @se = sales_engine
  end

  def all_merchant
    se.merchants.all
  end

  def all_items
    se.items.all
  end

  def average_items_per_merchant
    ((se.items.all.count)/(all_merchant.count.to_f)).round(2)
  end

  def collct_of_itms_cnts
    collection  = all_merchant.map do |merchant|
      merchant.items.count
    end
    collection
  end

  def items_qty
    collct_of_itms_cnts.count
  end

  def average_items_per_merchant_standard_deviation
    avg_itm_p_mrchnt = average_items_per_merchant
    merchant_deviation_calculator(collct_of_itms_cnts, avg_itm_p_mrchnt)
  end

  def merchant_deviation_calculator(collct_of_itms_cnts, avg_itm_p_mrchnt)
    pre_deviation = (collct_of_itms_cnts.reduce(0) do |accounter, average_num|
      accounter + ((average_num - avg_itm_p_mrchnt) ** 2)
    end)/(items_qty - 1).to_f
    Math.sqrt(pre_deviation).round(2)
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

  def average_item_price_standard_deviation
    mean = average_average_price_per_merchant
    items = all_items.map(&:unit_price)
    pre_deviation = (items.reduce(0) do |acc, avg_num|
      acc + ((avg_num - mean) ** 2)
    end)/(items.count - 1).to_f
    Math.sqrt(pre_deviation).round(2)
  end

  def golden_items
    deviation = (average_item_price_standard_deviation * 2)
    golden_price = deviation + average_average_price_per_merchant
    all_items.find_all do |item|
      item.unit_price > golden_price
    end
  end

end
