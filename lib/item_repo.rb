require "csv"
require "./lib/item"

class ItemRepo
  attr_accessor :all_items

  def initialize(file_path)
    @all_items = []
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each_with_index do |row|
      all_items << Item.new(row)
    end
  end

  def all
    all_items
  end

  def find_by_name(name)
    all_items.find do |item|
      item.name == name.downcase
    end
  end

  def find_by_id(id_number)
    all_items.find do |item|
      item.id == id_number
    end
  end

  def find_all_with_description(description)
    all_items.find_all do |item|
      item.description == description
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

end
