require_relative '../test_helper'
require_relative '../lib/invoice_item'
require "bigdecimal"

class InvoiceItemTest < Minitest::Test
  attr_reader :invoice_item

  def setup
    @invoice_item = InvoiceItem.new({
      :id => 6,
      :item_id => 7,
      :invoice_id => 8,
      :quantity => 1,
      :unit_price => BigDecimal.new(1200),
      :created_at => Time.now,
      :updated_at => Time.now
      }, nil)
  end


  def test_it_returns_id
    assert_equal 6, invoice_item.id
  end

  def test_returns_item_id
    assert_equal 7, invoice_item.item_id
  end

  def test_returns_invoice_id
    assert_equal 8, invoice_item.invoice_id
  end

  def test_returns_quantity
    assert_equal 1, invoice_item.quantity
  end

  def test_returns_unit_price
    assert_equal BigDecimal.new(12), invoice_item.unit_price
  end

  def test_returns_created_at
    assert_equal Time.parse(Time.now.to_s), invoice_item.created_at
  end

  def test_returns_updated_at
    assert_equal Time.parse(Time.now.to_s), invoice_item.updated_at
  end

  def test_returns_unit_price_to_dollar
    assert_equal 0.12, invoice_item.unit_price_to_dollars
  end

end
