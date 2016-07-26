require './test_helper'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_it_can_read_items_csv
    skip
    expected = "id,name,description,unit_price,merchant_id,created_at,updated_at\n"
    assert_equal expected, SalesEngine.new.from_csv('./test/support/items_test.csv')
  end

  def test_it_can_read_merchants_csv
    skip
    expected = "id,name,created_at,updated_at\n"
    assert_equal expected, SalesEngine.new.from_csv("./test/support/merchants_test.csv")
  end
end
