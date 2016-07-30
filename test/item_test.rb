require_relative '../test_helper'
require_relative '../lib/item'



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

end
