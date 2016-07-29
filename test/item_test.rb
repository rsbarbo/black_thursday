require_relative '../test_helper'
require_relative '../lib/item'
require_relative '../lib/sales_engine'
require 'csv'


class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    @item = Item.new({
      :id          => 1234567,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => BigDecimal.new(1200),
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :unit_price_to_dollars  => :unit_price,
      }, nil)
  end

  def test_it_returns_id
    assert_equal 1234567, item.id
  end

  def test_returns_name
    assert_equal "Pencil", item.name
  end

  def test_returns_description
    assert_equal "You can use it to write things", item.description
  end

  def test_returns_unit_price
    assert_equal BigDecimal.new(12), item.unit_price
  end

  def test_returns_created_at
    assert_equal Time.parse(Time.now.to_s), item.created_at
  end

  def test_returns_updated_at
    assert_equal Time.parse(Time.now.to_s), item.updated_at
  end

  def test_returns_unit_price_to_dollar
    assert_equal 0.12, item.unit_price_to_dollars
  end

  def test_it_returns_merchant_based_on_id_given_to_item
    se = SalesEngine.from_csv({:items => "./test/support/items_test.csv", :merchants => "./test/support/merchants_test.csv", :invoices => "./data/invoices.csv"})
    item = se.items.find_by_id(263567474)

    id_result     = item.merchant.id
    name_result   = item.merchant.name

    assert_equal 12334871, id_result
    assert_equal "TheSequinnedOwl", name_result
  end

end
