require_relative "../lib/merchant"
require "csv"

class MerchantRepo
  attr_accessor :all_merchants, :find_merchant_by_item_id
  attr_reader :engine

  def initialize(file_path, sales_engine)
    @all_merchants = []
    @engine = sales_engine
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_merchants << Merchant.new(row, self)
    end
  end

  def all
    all_merchants
  end

  def find_by_id(id_number)
    all_merchants.find do |merchant|
      merchant.id == id_number
    end
  end

  def find_by_name(name)
    all_merchants.find do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_name(name)
    all_merchants.find_all do |merchant|
      merchant.name.downcase.include?(name.downcase)
    end
  end

  def find_merchant_item_through_item_id(item_id)
    engine.items.all_items.select do |item|
      item.merchant_id == item_id
    end
  end

  def find_merchant_invoices_through_item_id(item_id)
    engine.invoices.all_invoices.select do |invoice|
      invoice.merchant_id == item_id
    end
  end

  def find_all_customers_by_merchant_id(id)
    customers = engine.invoices.find_all_by_merchant_id(id).map {|invoice| invoice.customer}
    customers.uniq
  end

end
