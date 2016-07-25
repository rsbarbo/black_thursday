require './test_helper'
require './lib/item'


class ItemTest < Minitest::Test
  def test_it_can_readlines_item_csv
    i = Item.new
    expected = "263395237"
    assert_equal expected, i.data_load[0]
  end

  def test_it_returns_the_integer_id_of_the_item
    skip
    i = Item.new
    assert_equal "id", i.get_id
  end
end
