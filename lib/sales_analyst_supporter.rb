require_relative "sales_engine"

class SASupporter

  def initialize
    @se =
  end

  def all_merchant
    se.merchants.all
  end

  def all_items
    se.items.all
  end

  def all_invoices
    se.invoices.all
  end

end
