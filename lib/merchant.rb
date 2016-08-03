require 'csv'
require 'bigdecimal'

class Merchant
  attr_reader :id,
  :name,
  :merchant_repo

  def initialize(row, merchant_repo)
    @id            = row[:id].to_i
    @name          = row[:name]
    @merchant_repo = merchant_repo
  end

  def items
    merchant_repo.find_merchant_item_through_item_id(id)
  end

  def invoices
    merchant_repo.find_merchant_invoices_through_item_id(id)
  end

  def customers
    merchant_repo.find_all_customers_by_merchant_id(id)
  end

  def revenue
      invoices.reduce(0) do |sum, invoice|
      sum += invoice.total if invoice.total != nil
      sum
    end
  end

  def transactions
    invoice_repo.transactions_from_transaction_repo(id)
  end

  def are_invoices_pending?
    invoices.any? do |invoice|
      invoice.is_pending?
    end
  end

end
