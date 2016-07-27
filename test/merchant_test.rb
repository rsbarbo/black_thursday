require "./test_helper"
require "./lib/merchant"

class MerchantTest < Minitest::Test
    attr_reader :m

  def setup
    @m = Merchant.new({:id => 5, :name => "Turing School"}, nil)
  end

  def test_returns_id
    assert_equal 5, m.id
  end

  def test_returns_name
    assert_equal "turing school", m.name
  end

end
