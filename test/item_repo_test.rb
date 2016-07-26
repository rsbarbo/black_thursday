require "./lib/item_repo"
require "./test_helper"


class ItemRepoTest < Minitest::Test

  def test_find_by_name
    item_repo = ItemRepo.new("./test/support/items_test.csv")

    assert_equal "2016-01-11 13:18:58 UTC", item_repo.find_by_name("two tone blue stoneware pot").created_at
    assert_equal "A rounded stoneware pot/bowl with a dark blue glaze and a white/blue glaze.\nA completely unique pot with lots of character\n9.5cm width\n6.5cm height", item_repo.find_by_name("two tone blue stoneware pot").description
    assert_equal 10.00, item_repo.find_by_name("two tone blue stoneware pot").unit_price_to_dollars
    assert_equal "12334609", item_repo.find_by_name("two tone blue stoneware pot").merchant_id
  end

  def method_name
    skip
    #name = 510+ realpush icon set
  end
end
