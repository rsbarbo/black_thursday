require './test_helper'
require './lib/item'
require 'csv'
require './lib/sales_engine'


class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    @item = Item.new({
      :id          => 1234567,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => BigDecimal.new(10.99,4),
      :created_at  => "2016-07-26 08:05:03 -0600",
      :updated_at  => "2016-07-26 08:05:03 -0600",
      :unit_price_to_dollars  => 0.1099,
      }, nil)
  end

  def test_it_returns_id
    assert_equal 1234567, item.id
  end

  def test_returns_name
    assert_equal "pencil", item.name
  end

  def test_returns_description
    assert_equal "You can use it to write things", item.description
  end

  def test_returns_unit_price
    assert_equal 0.1099, item.unit_price_to_dollars
  end

  def test_returns_created_at
    assert_equal "2016-07-26 08:05:03 -0600", item.created_at
  end

  def test_returns_updated_at
    assert_equal "2016-07-26 08:05:03 -0600", item.updated_at
  end

  def test_returns_unit_price
    assert_equal 10.99, item.unit_price.to_f
  end

  def test_it_returns_items_based_on_id_given_to_item
    se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
    item = se.items.find_by_id(263395237)

    id_result 				 = item.merchant[0].id
    # name_result        = item.merchant[0].name
    # unit_price_result  = item.merchant[0].unit_price.to_f
    # merchant_id_result = item.merchant[0].merchant_id
    # created_at_result  = item.merchant[0].created_at
    # updated_at_result  = item.merchant[0].updated_at

    assert_equal 0, id_result
    # assert_equal "510+ realpush icon set", name_result
    # assert_equal 1200.00, unit_price_result
    # assert_equal 12334141, merchant_id_result
    # assert_equal "2016-01-11 09:34:06 UTC", created_at_result
    # assert_equal "2007-06-04 21:35:10 UTC", updated_at_result
  end
end
