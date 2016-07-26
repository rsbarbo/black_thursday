require "csv"
require "./lib/item"

class ItemRepo


  def initialize(file_path)
    @all_items = {}
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each_with_index do |row, index|
      @all_items[index] = Item.new(row)
    end
  end

  def find_by_name(name)
    @all_items.values.find do |item|
      item.name == name
    end
  end


end
