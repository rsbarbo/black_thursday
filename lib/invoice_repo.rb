require_relative "../lib/invoice"
require "csv"

class InvoiceRepo
  attr_reader :engine
  attr_accessor :all_invoices

  def initialize(file_path, sales_engine)
    @all_invoices = []
    @engine       = sales_engine
    @load_csvs    = load_csvs(file_path)
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
      invoice.status == status.to_sym
    end
  end

  def find_invoices_by_merchant_id(merchant_id)
    engine.merchants.all_merchants.select do |merchant|
      merchant.id == merchant_id
    end.first
  end

  def find_items_by_invoice_id(inv_id)
    find_by_inv_id = engine.invoice_items.find_all_by_invoice_id(inv_id)
    itm_ids = find_by_inv_id.map do |inv_item|
      inv_item.item_id if inv_item.invoice_id == inv_id
    end
    collect_items_based_on_itm_ids(itm_ids)
  end

  def collect_items_based_on_itm_ids(itm_ids)
    coll_of_item_instans = []
    itm_ids.map do |id|
      coll_of_item_instans << engine.items.find_by_id(id)
    end
    coll_of_item_instans
  end

  def find_invoices_by_transaction_id(invoice_id)
    coll_of_trans_instances = []
    engine.transactions.all_transactions.select do |transct|
       coll_of_trans_instances << transct if transct.invoice_id == invoice_id
    end
    coll_of_trans_instances
  end

  def invoices_paid_in_full?(id)
    transactions = engine.transactions.all_transactions
    trans_result = transactions.find_all do |transaction|
      transaction.invoice_id == id
    end
    checking_invoices(trans_result)
  end

  def checking_invoices(trans_result)
    trans_result.any? do |transaction|
      transaction.result == "success"
    end
  end

  def checking_total(id)
    find_all_invs = engine.invoice_items.find_all_by_invoice_id(id)
    totals = find_all_invs.map {|item| item.quantity * item.unit_price}
    totals.reduce(&:+)
  end

end
