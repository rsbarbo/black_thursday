require_relative "../lib/sales_engine"

class Supporter

  def se
  SalesEngine.from_csv({:items=>"./test/support/items.csv",
    :merchants=>"./test/support/merchants.csv",
    :invoices=>"./test/support/invoices.csv",
    :invoice_items=>"./test/support/invoice_items.csv",
    :transactions=>"./test/support/transactions.csv",
    :customers=>"./test/support/customers.csv"})
  end

  def input
    {:items=>"./test/support/items.csv",
      :merchants=>"./test/support/merchants.csv",
      :invoices=>"./test/support/invoices.csv",
      :invoice_items=>"./test/support/invoice_items.csv",
      :transactions=>"./test/support/transactions.csv",
      :customers=>"./test/support/customers.csv"}
  end

end
