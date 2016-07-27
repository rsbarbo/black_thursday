require_relative "../lib/sales_engine"

class SalesAnalyst

  def initialize(se)
    @se = se
  end

end

if __FILE__ == $0
se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
sa = SalesAnalyst.new(se)
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
