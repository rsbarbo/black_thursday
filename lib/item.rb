require 'bigdecimal'
require 'csv'
require 'time'

class Item
  attr_reader :id, :name, :description, :unit_price,
  :created_at, :updated_at, :merchant_id,
  :unit_price_to_dollars, :item_repo

  def initialize(row, item_repo)
    @id = row[:id].to_i
    @name = row[:name]
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price]) 
    @created_at = Time.parse(row[:created_at].to_s)
    @updated_at = Time.parse(row[:updated_at].to_s)
    @merchant_id = row[:merchant_id].to_i
    @unit_price_to_dollars = unit_price.to_f / 100
    @item_repo = item_repo
  end

  def merchant
    item_repo.find_items_by_merchant_id(merchant_id)
  end

end
