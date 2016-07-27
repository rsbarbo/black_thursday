require 'bigdecimal'
require 'csv'
require 'time'


class Item
  attr_reader :id, :name, :description, :unit_price,
  :created_at, :updated_at, :merchant_id,
  :unit_price_to_dollars, :engine

  def initialize(row, sales_engine)
    @id = row[:id].to_i
    @name = row[:name]
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price])
    @created_at = Time.parse(row[:created_at].to_s)
    @updated_at = Time.parse(row[:updated_at].to_s)
    @merchant_id = row[:merchant_id].to_i
    @unit_price_to_dollars = unit_price.to_f / 100
    @engine = sales_engine
  end

  def merchant
    engine.merchants.all_merchants.select do |merchant|
      merchant.id == self.merchant_id
    end
  end

end
