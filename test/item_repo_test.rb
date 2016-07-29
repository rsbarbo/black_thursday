require "./lib/item_repo"
require "./test_helper"


class ItemRepoTest < Minitest::Test

  def test_returns_all_items
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal 4, item_repo.all_items.length
  end

  def test_it_returns_item_when_searched_by_id
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_instance_of Item, item_repo.find_by_id(263567474)

  end

  def test_it_returns_nil_when_searched_by_invalid_id
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal nil, item_repo.find_by_id(0000000)
  end


  def test_find_by_name_regardless_of_case
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal "Minty Green Knit Crochet Infinity Scarf", item_repo.find_by_name("Minty Green Knit Crochet Infinity Scarf").name
    assert_equal "Minty Green Knit Crochet Infinity Scarf", item_repo.find_by_name("minty green KnIt CrOcHet Infinity Scarf").name
  end

  def test_find_by_name_return_nil_for_invalid_name
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal nil, item_repo.find_by_name("kjadkjashdkjas")
  end

  def test_find_by_name_and_return_values
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal Time.parse("2016-01-11 20:59:20 UTC"), item_repo.find_by_name("Minty Green Knit Crochet Infinity Scarf").created_at
    expected_description = "- Super Chunky knit infinity scarf\n- Soft mixture of 97% Acrylic and 3% Viscose\n- Beautiful, Warm, and Stylish\n- Very easy to care for\n\nHand wash with cold water and lay flat to dry"
    assert_equal expected_description, item_repo.find_by_name("Minty Green Knit Crochet Infinity Scarf").description
    assert_equal 0.38, item_repo.find_by_name("Minty Green Knit Crochet Infinity Scarf").unit_price_to_dollars
    assert_equal 12334871, item_repo.find_by_name("Minty Green Knit Crochet Infinity Scarf").merchant_id
  end

  def test_all_returns_all_items
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal 4, item_repo.all.length
  end

  def test_find_all_with_description
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    description = "- Super Chunky knit infinity scarf\n- Soft mixture of 97% Acrylic and 3% Viscose\n- Beautiful, Warm, and Stylish\n- Very easy to care for\n\nHand wash with cold water and lay flat to dry"
    expected = "- Super Chunky knit infinity scarf\n- Soft mixture of 97% Acrylic and 3% Viscose\n- Beautiful, Warm, and Stylish\n- Very easy to care for\n\nHand wash with cold water and lay flat to dry"
    assert_equal expected, item_repo.find_all_with_description(description).first.description
  end

  def test_find_all_with_description_when_description_is_not_valid
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal [], item_repo.find_all_with_description("^")
  end

  def test_find_all_by_price
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal 1, item_repo.find_all_by_price(BigDecimal.new(61)).length
  end

  def test_find_all_by_price_when_price_is_not_valid
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal [], item_repo.find_all_by_price(BigDecimal.new(2000000))
  end

  def test_find_all_by_price_in_range
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal 1, item_repo.find_all_by_price_in_range(61..62).length
  end

  def test_return_an_empty_array_if_price_is_not_in_valid_range
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal [], item_repo.find_all_by_price_in_range(1000000000.00..1500000000000.00)
  end

  def test_find_all_by_merchant_id
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal 2, item_repo.find_all_by_merchant_id(12336622).length
  end

  def test_returns_empty_array_when_no_merchant_id_is_invalid
    item_repo = ItemRepo.new("./test/support/items_test.csv", nil)
    assert_equal [], item_repo.find_all_by_merchant_id(98798798798)
  end

end
