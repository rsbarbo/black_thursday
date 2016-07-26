require "csv"
require "./lib/item"
require 'pry'

class ItemRepo
  attr_accessor :all_items

  def initialize(file_path)
    @all_items = {}
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each_with_index do |row, index|
      all_items[index] = Item.new(row)
    end
  end

  def all
    all_items
  end

  def find_by_name(name)
    all_items.values.find do |item|
      item.name == name.downcase
    end
  end

  def find_by_id(id_number)
    all_items.values.find do |item|
      item.id == id_number
    end
  end

  def find_all_with_description(description)
    all_items
  end
end
