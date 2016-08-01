require_relative "../lib/transaction"
require "csv"

class TransactionRepo
  attr_reader :all_transactions

  def initialize(file_path, sales_engine)
    @all_transactions = []
    @engine = sales_engine
    @load_csvs = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_transactions << Transaction.new(row, self)
    end
  end

  def all
    all_transactions
  end

  def find_by_id(transaction_id)
    all_transactions.find do |transaction|
      transaction.id == transaction_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    all_transactions.find_all do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_all_by_credit_card_number(cc_number)
    all_transactions.find_all do |transaction|
      transaction.credit_card_number == cc_number
    end
  end

  def find_all_by_result(result_term)
    all_transactions.find_all do |transaction|
      transaction.result == result_term
    end
  end

end
