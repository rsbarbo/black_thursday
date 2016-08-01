require 'csv'
require 'time'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :invoice_repo

  def initialize(row, invoice_repo)
    @id           = row[:id].to_i
    @customer_id  = row[:customer_id].to_i
    @merchant_id  = row[:merchant_id].to_i
    @status       = row[:status].to_sym
    @created_at   = Time.parse(row[:created_at].to_s)
    @updated_at   = Time.parse(row[:updated_at].to_s)
    @invoice_repo = invoice_repo
  end

  def merchant
    invoice_repo.find_invoices_by_merchant_id(merchant_id)
  end

  def items
    invoice_repo.find_items_by_invoice_id(id)
  end

  def transactions
    invoice_repo.find_invoices_by_transaction_id(id)
  end

  def customer
    invoice_repo.engine.customers.find_by_id(customer_id)
  end

end
