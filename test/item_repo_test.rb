require "./lib/item_repo"
require "./test_helper"


class ItemRepoTest < Minitest::Test

  def test_find_by_name
    item_repo = ItemRepo.new("./test/support/items_test.csv")
    assert_equal "", item_repo.find_by_name("Two tone blue stoneware pot")
  end

end
