require_relative "../lib/invoice_item"
require "csv"

class InvoiceItemRepo
  attr_reader :engine
  attr_accessor :all_invoice_items

  def initialize(file_path, sales_engine)
    @all_invoice_items = []
    @engine = sales_engine
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_invoices << InvoiceItem.new(row, self)
    end
  end

  def all
    all_invoice_items
  end
  
end
