require "csv"
require_relative "../lib/invoice_item"

class InvoiceItemRepo
  attr_reader   :engine
  attr_accessor :all_invoice_items

  def initialize(file_path, sales_engine)
    @all_invoice_items = []
    @engine            = sales_engine
    @load_csvs         = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_invoice_items << InvoiceItem.new(row, self)
    end
  end

  def all
    all_invoice_items
  end

  def find_by_id(id)
    all_invoice_items.find do |invoice_item|
      invoice_item.id == id
    end
  end

  def find_all_by_item_id(item_id)
    all_invoice_items.find_all do |invoice_item|
      invoice_item.item_id == item_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    all_invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == invoice_id
    end
  end

end
