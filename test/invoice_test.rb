require "./test_helper"
require_relative "../lib/invoice"

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    @invoice = Invoice.new({
      :id          => 6,
      :customer_id => 7,
      :merchant_id => 8,
      :status      => "pending",
      :created_at  => Time.now,
      :updated_at  => Time.now,
      }, nil)
  end

  def test_it_returns_id
    assert_equal 6, invoice.id
  end

  def test_it_returns_customer_id
    assert_equal 7, invoice.customer_id
  end

  def test_it_returns_merchant_id
    assert_equal 8, invoice.merchant_id
  end

  def test_it_returns_invoice_status
    assert_equal :pending, invoice.status
  end

  def test_returns_created_at
    assert_equal Time.parse(Time.now.to_s), invoice.created_at
  end

  def test_returns_updated_at
    assert_equal Time.parse(Time.now.to_s), invoice.updated_at
  end

end
