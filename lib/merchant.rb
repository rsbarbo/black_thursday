require 'csv'
require 'bigdecimal'
class Merchant

  attr_reader :id, :name, :engine

  def initialize(row, sales_engine)
    @id = row[:id].to_i
    @name = row[:name].downcase
    @engine = sales_engine
  end

  def items
    s = engine.items.all_items.select do |item|
      item.merchant_id == self.id
    end
  end
end
