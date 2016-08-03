module SalesAnalystAssistant

  def all_merchant
    se.merchants.all
  end

  def all_items
    se.items.all
  end

  def all_invoices
    se.invoices.all
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

  def merchant_deviation_calculator(collct_of_itms_cnts, avg_itm_p_mrchnt)
    pre_deviation = (collct_of_itms_cnts.reduce(0) do |accounter, average_num|
      accounter + ((average_num - avg_itm_p_mrchnt) ** 2)
    end)/(items_qty - 1).to_f
    Math.sqrt(pre_deviation).round(2)
  end

  def average_item_price_standard_deviation
    avg_avg_p_merchant = average_average_price_per_merchant
    items = all_items.map(&:unit_price)
    pre_deviation = (items.reduce(0) do |accounter, avg_num|
      accounter + ((avg_num - avg_avg_p_merchant) ** 2)
    end)/(items.count - 1).to_f
    Math.sqrt(pre_deviation).round(2)
  end

end
