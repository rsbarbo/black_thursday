require "./lib/invoice_repo"
require "./test_helper"


class InvoiceRepoTest < Minitest::Test
  

  def test_returns_all_items
    invoice_repo = InvoiceRepo.new("./test/support/invoices_test.csv", nil)
    assert_equal 200, invoice_repo.all_invoices.length
  end

end
