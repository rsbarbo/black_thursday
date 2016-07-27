require './test_helper'
require './lib/item'


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

  def test_it_retunrs_id
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
end
