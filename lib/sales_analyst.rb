require_relative "../lib/sales_engine"

class SalesAnalyst
  attr_reader :se

  def initialize(sales_engine)
    @se = sales_engine
  end

  def average_items_per_merchant
    ((se.items.all.count)/(se.merchants.all.count.to_f)).round(2)
  end

  #perhaps create a supporter file for those extra calculations
  #that does not need to be here??? Will brainstorm with Super Susi
  def items_calculator
    se.merchants.all.map do |merchant|
      merchant.items.count
    end
  end

  def average_items_per_merchant_standard_deviation
    avg_item_p_merchant = average_items_per_merchant
    deviation_calculator(items_calculator, avg_item_p_merchant)
  end

  #perhaps create a supporter file for those extra calculations
  #that does not need to be here??? Will brainstorm with Super Susi
  def deviation_calculator(items_calculator, avg_item_p_merchant)
    pre_deviation = (items_calculator.reduce(0) do |accounter, average_num|
      accounter + ((average_num - avg_item_p_merchant) ** 2)
    end)/(items_calculator.count - 1).to_f
    Math.sqrt(pre_deviation).round(2)
  end


end


# sa = SalesAnalyst.new(se)
# sa.average_items_per_merchant
## needs to look into the find_all_items_by_merchant_id in order to get a count

# sa.average_items_per_merchant_standard_deviation
##comparing merchant to merchant
##what is the spread?
##you need to find the average of all items sold by merchants
##so we will most liekly use an enum like .reduce to iterate through the
##average from each merchant and then do the standard deviation math
### of deviations 1


if __FILE__ == $0
  se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
  sa = SalesAnalyst.new(se)
end
