require_relative "../lib/item"
require "csv"

class ItemRepo
  attr_reader :engine
  attr_accessor :all_items, :items, :find_all_by_merchant_id

  def initialize(file_path, sales_engine)
    @all_items = []
    @engine = sales_engine
    @load_csvs = load_csvs(file_path)
    @items = []
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_items << Item.new(row, self)
    end
  end

  def all
    all_items
  end

  def find_by_name(name)
    all_items.find do |item|
      item.name.downcase == name.downcase
    end
  end

  def find_by_id(id_number)
    all_items.find do |item|
      item.id == id_number
    end
    # binding.pry
  end

  def find_all_with_description(description)
    all_items.find_all do |item|
      item.description.downcase == description.downcase
    end
  end

  def find_all_by_price(price)
    all_items.find_all do |item|
      item.unit_price == price
    end
  end


  def find_all_by_price_in_range(range)
    all_items.find_all do |item|
      item if item.unit_price.between?(range.first, range.last)
    end
  end

  def find_all_by_merchant_id(id)
    all_items.find_all do |item|
      item.merchant_id == id
    end
  end

def find_items_by_merchant_id(merchant_id)
  engine.merchants.all_merchants.select do |merchant|
      merchant.id == merchant_id
  end
end

end
