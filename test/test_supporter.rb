class Supporter

def se
  SalesEngine.from_csv({:items=>"./test/support/items_test.csv",
                        :merchants=>"./test/support/merchants_test.csv",
                        :invoices=>"./test/support/invoices_test.csv",
                        :invoice_items=>"./test/support/invoice_items_test.csv",
                        :transactions=>"./test/support/transactions_test.csv",
                        :customers=>"./test/support/customers_test.csv"})
end

end
