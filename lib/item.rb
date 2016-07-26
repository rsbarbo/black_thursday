require 'pry'
require 'csv'
require 'bigdecimal'


class Item
  attr_reader :id, :name, :description, :unit_price,
              :created_at, :updated_at, :merchant_id,
              :unit_price_to_dollars

  def initialize(row)
    @id = row[:id].to_i
    @name = row[:name]
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price])
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @merchant_id = row[:merchant_id]
    @unit_price_to_dollars = unit_price.to_f / 100
  end

end
