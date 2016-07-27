require 'csv'
require 'bigdecimal'


class Item
  attr_reader :id, :name, :description, :unit_price,
  :created_at, :updated_at, :merchant_id,
  :unit_price_to_dollars, :engine

  def initialize(row, sales_engine)
    @id = row[:id].to_i
    @name = row[:name].downcase
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price])
    @created_at = row[:created_at].to_s
    @updated_at = row[:updated_at].to_s
    @merchant_id = row[:merchant_id].to_i
    @unit_price_to_dollars = unit_price.to_f / 100
    @engine = sales_engine
  end

  def merchant
    # engine.merchants.all_merchants.select do |merchant|
    # we will have the item ID coming in
    #the item ID is not available in the merchant csv
    #we need to convert the item ID coming in to either name or merchant ID
    #HOW WE WILL DO TH
    # Merchant ID and Name are the only things in common we have with Merchant
    # we need to find one thing in common that we can use to return the instance of merchant\
    end
  end

end
