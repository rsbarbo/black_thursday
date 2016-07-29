require_relative "../lib/invoice"
require "csv"
require "pry"

class InvoiceRepo
  attr_reader :engine
  attr_accessor :all_invoices

  def initialize(file_path, sales_engine)
    @all_invoices = []
    @engine = sales_engine
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_invoices << Invoice.new(row, self)
    end
  end

  def all
    all_invoices
  end

  def find_by_id(id_number)
    all_invoices.find do |invoice|
      invoice.id == id_number
    end
  end

  def find_all_by_customer_id(customer_id)
    all_invoices.find_all do |invoice|
      invoice.customer_id == customer_id
    end
  end

  def find_all_by_merchant_id(merchant_id)
    all_invoices.find_all do |invoice|
      invoice.merchant_id == merchant_id
    end
  end

  def find_all_by_status(status)
    all_invoices.find_all do |invoice|
      invoice.status == status
    end
  end
#find_all_by_status - returns either [] or one or more matches which have a matching status

end
