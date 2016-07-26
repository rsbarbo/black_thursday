require "./lib/item_repo"
require "./test_helper"


class ItemRepoTest < Minitest::Test

  def test_returns_all_items
    item_repo = ItemRepo.new("./test/support/items_test.csv")
    assert_equal 1367, item_repo.all_items.length
  end

  def test_it_returns_by_id
    item_repo = ItemRepo.new("./test/support/items_test.csv")
    description_return = "This is a wooden picture frame made to order in any color you would like. Image not included in purchase.\n\nfor portrait style it is:\n10&quot; tall and 6&quot; wide\n\nFor landscape style it is:\n10&quot; wide and 6&quot; tall"
    assert_equal "wooden picture frames", item_repo.find_by_id(263565882).name
    assert_equal description_return, item_repo.find_by_id(263565882).description
    assert_equal "2016-01-11 20:53:42 UTC", item_repo.find_by_id(263565882).created_at
    assert_equal 45.00, item_repo.find_by_id(263565882).unit_price_to_dollars

  end

  def test_find_by_name
    item_repo = ItemRepo.new("./test/support/items_test.csv")
    assert_equal "2016-01-11 13:18:58 UTC", item_repo.find_by_name("two tone blue stoneware pot").created_at
    assert_equal "A rounded stoneware pot/bowl with a dark blue glaze and a white/blue glaze.\nA completely unique pot with lots of character\n9.5cm width\n6.5cm height", item_repo.find_by_name("two tone blue stoneware pot").description
    assert_equal 10.00, item_repo.find_by_name("two tone blue stoneware pot").unit_price_to_dollars
    assert_equal "12334609", item_repo.find_by_name("two tone blue stoneware pot").merchant_id
  end

  def method_name
    skip
    #test case for name starts with number = 510+ realpush icon set
  end
end
