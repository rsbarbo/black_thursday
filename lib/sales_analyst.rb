require_relative "../lib/sales_engine"

class SalesAnalyst
  attr_reader :se

  def initialize(sales_engine)
    @se = sales_engine
  end

  def average_items_per_merchant
    ((se.items.all.count)/(se.merchants.all.count.to_f)).round(2)
  end

  def collection_of_items_counts
    collection  = se.merchants.all.map do |merchant|
      merchant.items.count
    end
    collection
  end

  def items_qty
    collection_of_items_counts.count
  end

  def average_items_per_merchant_standard_deviation
    avg_item_p_merchant = average_items_per_merchant
    deviation_calculator(collection_of_items_counts, avg_item_p_merchant)
  end

  def deviation_calculator(collection_of_items_counts, avg_item_p_merchant)
    pre_deviation = (collection_of_items_counts.reduce(0) do |accounter, average_num|
      accounter + ((average_num - avg_item_p_merchant) ** 2)
    end)/(items_qty - 1).to_f
    Math.sqrt(pre_deviation).round(2)
  end

  def merchants_with_high_item_count
    high_count = average_items_per_merchant_standard_deviation + average_items_per_merchant
    se.merchants.all.find_all do |merchant|
    merchant.items.count > high_count
    end
  end

end

if __FILE__ == $0
  se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
  sa = SalesAnalyst.new(se)
end
